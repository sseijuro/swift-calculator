enum ColorType {
    case Gray
    case LightGray
    case Orange
}

struct Button {
    let isOperation: Bool
    let value: Character
    let color: ColorType
}

extension Button {
    static var getAll: [Button] = [
        Button(isOperation: true, value: "C", color: .LightGray),
        Button(isOperation: true, value: "±", color: .LightGray),
        Button(isOperation: true, value: "%", color: .LightGray),
        Button(isOperation: true, value: "/", color: .Orange),
        Button(isOperation: false, value: "7", color: .Gray),
        Button(isOperation: false, value: "8", color: .Gray),
        Button(isOperation: false, value: "9", color: .Gray),
        Button(isOperation: true, value: "*", color: .Orange),
        Button(isOperation: false, value: "4", color: .Gray),
        Button(isOperation: false, value: "5", color: .Gray),
        Button(isOperation: false, value: "6", color: .Gray),
        Button(isOperation: true, value: "-", color: .Orange),
        Button(isOperation: false, value: "1", color: .Gray),
        Button(isOperation: false, value: "2", color: .Gray),
        Button(isOperation: false, value: "3", color: .Gray),
        Button(isOperation: true, value: "+", color: .Orange),
        Button(isOperation: false, value: "0", color: .Gray),
        Button(isOperation: false, value: ".", color: .Gray),
        Button(isOperation: true, value: "=", color: .Orange)
    ]
}

