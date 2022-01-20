import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    static let identifier = "labelCell"

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type expression..."
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        backgroundColor = .black

        NSLayoutConstraint.activate([
            label.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -25),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

