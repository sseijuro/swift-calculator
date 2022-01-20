import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {

    static let identifier = "buttonCell"
    
    let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: widthAnchor),
            button.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    func setTitle(withTitle title: Character) {
        button.setTitle(String(title), for: .normal)
    }
    
    func setFontSize(withSize size: CGFloat) {
        button.titleLabel?.font = .systemFont(ofSize: size)
    }
    
    func setColor(withColor color: ColorType) {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
