import UIKit

class CalculatorController: UIViewController {
    var model: CalculatorModelProtocol = CalculatorModel()
    
    override func loadView() {
        super.loadView()
        view = CalculatorView(frame: view.bounds)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        guard let symbol = sender.currentTitle else { return }
        model.processSymbol(symbol: symbol)
        resultArea?.text = model.getValue
    }
}

extension CalculatorController {
    private var resultArea: UILabel? {
        guard let view = view as? CalculatorView else { return nil }
        return view.resultArea
    }
    
    private var calculatorCollection: UICollectionView? {
        guard let view = view as? CalculatorView else { return nil }
        return view.collection
    }
}

extension CalculatorController: UICollectionViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCollection?.delegate = self
        calculatorCollection?.dataSource = self
    }
}

extension CalculatorController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier,
                                 for: indexPath) as! ButtonCollectionViewCell
        let button = Button.getAll[indexPath.row]
        
        cell.setTitle(withTitle: button.value)
        cell.setColor(withColor: button.color)
        cell.setFontSize(withSize: 32)
        
        cell.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return cell
    }
}
