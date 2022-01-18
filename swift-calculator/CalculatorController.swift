import UIKit

class CalculatorController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var model: CalculatorModel = CalculatorModel()
    
    private var mainView: CalculatorView? {
        guard let view = view else { return nil }
        return view as? CalculatorView
    }
    
    override func loadView() {
        view = CalculatorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView?.calculatorCollection.delegate = self
        mainView?.calculatorCollection.dataSource = self
    }
    
    @objc func buttonPressed(sender: UIButton) {
        guard let action = sender.currentTitle else { return }
        mainView?.setResultArea(withTitle: action)
        // to implement work with model
    }
}

extension CalculatorController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorView.cellIdentifier, for: indexPath)
        
        if indexPath.row == 0 {
            cell.backgroundColor = .black
            UILabel.addLabel(toView: cell)
            mainView?.resultArea = cell
            return cell
        }
        
        guard let buttonObj = mainView?.calculatorButtons[indexPath.row - 1] else {
            return cell
        }
        
        let button = UIButton.addButton(toView: cell, withTitle: buttonObj.value, withColor: buttonObj.color)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return cell
    }
}
