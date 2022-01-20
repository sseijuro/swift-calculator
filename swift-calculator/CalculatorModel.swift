protocol CalculatorModelProtocol {
    var getValue: String { get }
    mutating func processSymbol(symbol: String)
}

struct Number {
    var value: String
    var isSetDot: Bool = false
    var isEmpty: Bool {
        value.count == 0
    }
}

struct CalculatorModel {
    private var lhs: Number = Number(value: "")
    private var rhs: Number = Number(value: "")
    private var operation: String?
    private var error: String?
}

extension CalculatorModel: CalculatorModelProtocol {
    var getValue: String {
        error == nil ? !lhs.isEmpty ? !rhs.isEmpty ? rhs.value : lhs.value : "" : error!
    }
    
    mutating func processSymbol(symbol: String) {
        guard let first = symbol.first else { return }
        let symbols = Button.getAll.filter({ $0.value == first })
        guard symbols.count != 0 else { return }
        
        if symbols[0].isOperation {
            guard error == nil else { return }
            processOperator(withOperation: symbol)
        } else {
            error = nil
            symbols[0].value == "." ? processDot() : processNumber(number: symbol)
        }
    }
}

extension CalculatorModel {
    private var lhsToFloat: Float? {
        guard let lhs = Float(lhs.value) else { return nil }
        return lhs
    }
    
    private var rhsToFloat: Float? {
        guard let rhs = Float(rhs.value) else { return nil }
        return rhs
    }
    
    private mutating func processNumber(number: String) {
        if operation == nil {
            lhs.value.append(number)
        } else {
            rhs.value.append(number)
        }
    }
    
    private mutating func processDot() {
        if operation == nil && !lhs.isSetDot && !lhs.isEmpty {
            lhs.value.append(".")
            lhs.isSetDot = true
        } else if !rhs.isSetDot && !rhs.isEmpty {
            rhs.value.append(".")
            rhs.isSetDot = true
        }
    }
    
    private mutating func processOperator(withOperation task: String) {
        if task == "C" {
            operation = task
            useOperation()
            return
        }
        
        guard !lhs.isEmpty else { return }
        
        
        if !rhs.isEmpty {
            useOperation()
        }
        
        if task != "=" {
            operation = task
        }
        
        if rhs.isEmpty && task == "%" {
            useOperation()
            return
        }
    }
    
    private mutating func useOperation() {
        switch operation {
            case "C": clear()
                break
            case "%": percent()
                break
            case "/": divide()
                break
            case "*": multiply()
                break
            case "-": minus()
                break
            case "+": plus()
                break
            case "=": equal()
                break
            default:
                print("Operator \(operation ?? "") not implemented")
                break
        }
    }
    
    private mutating func clear() {
        update(number: "")
    }
    
    private mutating func percent() {
        guard let number = lhsToFloat else { return }
        update(number: String(number * 0.01))
    }
    
    private mutating func divide() {
        guard let number1 = lhsToFloat,
              let number2 = rhsToFloat else { return }
        if number2 == 0 {
            update(number: "", withError: "Error: division by zero!")
            return
        }
        update(number: String(number1 / number2))
    }
    
    private mutating func multiply() {
        guard let number1 = lhsToFloat,
              let number2 = rhsToFloat else { return }
        update(number: String(number1 * number2))
    }
    
    private mutating func minus() {
        guard let number1 = lhsToFloat,
              let number2 = rhsToFloat else { return }
        update(number: String(number1 - number2))
    }
    
    private mutating func plus() {
        guard let number1 = lhsToFloat,
              let number2 = rhsToFloat else { return }
        update(number: String(number1 + number2))
    }
    
    private mutating func equal() {
        guard operation == nil else { return }
        useOperation()
    }
    
    private mutating func update(number: String, withError err: String? = nil) {
        lhs = Number(value: number)
        rhs = Number(value: "")
        operation = nil
        error = err
    }
    
}
