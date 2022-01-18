struct CalculatorModel {
    private var lhs: String?
    private var rhs: String?
    private var operation: String?
}

extension CalculatorModel {
    var current: String {
        guard let rhs = rhs else { return "0" }
        guard let lhs = lhs else { return rhs }
        return lhs
    }
    
    mutating func clear() {
        lhs = nil
        rhs = nil
        operation = nil
    }
    
    // to implement methods
    mutating func percent() {}
    mutating func divide() {}
    mutating func multiply() {}
    mutating func minus() {}
    mutating func plus() {}
    mutating func plusMinus() {}
    
    mutating func equal() {
        guard lhs != nil else { return }
        
        guard rhs != nil else {
            operation = nil
            return
        }
        
        guard let operation = operation else { return }
        
        switch operation {
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
            default:
                break
        }
    }
    
    
}
