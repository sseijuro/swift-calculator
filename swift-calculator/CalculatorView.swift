import UIKit

class CalculatorView: UIView {
    static var cellIdentifier: String = "calcCell"
    
    var calculatorButtons: [Button] = Button.getCalculatorButtons()
    
    var resultArea: UICollectionViewCell?
    var calculatorCollection: UICollectionView = {
        let calculatorCollection = UICollectionView(frame: .zero,
                                                    collectionViewLayout: .getCalculatorCompositionalLayout())
        calculatorCollection.backgroundColor = .white
        calculatorCollection.translatesAutoresizingMaskIntoConstraints = false
        calculatorCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CalculatorView.cellIdentifier)
        return calculatorCollection
    }()
    
    var safeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(safeView)
        safeView.addSubview(calculatorCollection)
        
        NSLayoutConstraint.activate([
            safeView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            safeView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            safeView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            safeView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            calculatorCollection.leadingAnchor.constraint(equalTo: safeView.leadingAnchor),
            calculatorCollection.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
            calculatorCollection.bottomAnchor.constraint(equalTo: safeView.bottomAnchor),
            calculatorCollection.topAnchor.constraint(equalTo: safeView.topAnchor),
        ])
        safeView.addSubview(calculatorCollection)
    }
    
    func setResultArea(withTitle title: String) {
        let label = resultArea?.subviews[0] as? UILabel
        label?.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
