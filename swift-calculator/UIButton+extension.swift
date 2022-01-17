import UIKit

extension UIButton {
   static func addButton(toView view: UIView,
                         withTitle title: Character,
                         withColor color: ColorType) -> UIButton {
       let button = UIButton(frame: .zero)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle(String(title), for: .normal)
       button.titleLabel?.font = .systemFont(ofSize: 32)
       
       switch color {
           case .Orange:
               button.backgroundColor = .systemOrange
           break
           case .Gray:
               button.backgroundColor = .gray
           break
           case .LightGray:
               button.backgroundColor = .lightGray
           break
       }
       
       view.addSubview(button)
       
       NSLayoutConstraint.activate([
           button.widthAnchor.constraint(equalTo: view.widthAnchor),
           button.heightAnchor.constraint(equalTo: view.heightAnchor)
       ])
       return button
   }
}


