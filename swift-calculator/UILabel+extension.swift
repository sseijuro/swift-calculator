import UIKit

extension UILabel {
    static func addLabel(toView view: UIView) {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type expression..."
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .right
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20)
        ])
    }
}
