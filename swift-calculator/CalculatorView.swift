import UIKit

class CalculatorView: UIView {
    lazy var resultArea: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .right
        label.backgroundColor = .black
        return label
    }()
    
    lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: .getCalculatorCompositionalLayout())
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ButtonCollectionViewCell.self,
                                      forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalculatorView {
    private func setupSubViewsAndConstraints() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultArea)
        addSubview(collection)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            resultArea.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            resultArea.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            resultArea.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor,
                                               multiplier: 2/7),
            resultArea.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            collection.topAnchor.constraint(equalTo: resultArea.bottomAnchor),
            collection.widthAnchor.constraint(equalTo: widthAnchor),
            collection.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor,
                                               multiplier: 5/7),
        ])
    }
}
