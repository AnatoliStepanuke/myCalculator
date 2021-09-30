import UIKit

final class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var mainOutputLabel: UILabel!
    
    @IBOutlet private var numbersOutletCollection: [UIButton]!
    
    @IBOutlet weak private var plusOperationButton: UIButton!
    @IBOutlet weak private var minusOperationButton: UIButton!
    @IBOutlet weak private var equalsOperationButton: UIButton!
    @IBOutlet weak private var clearFieldOperationButton: UIButton!
    
    // MARK: - Inner type
    private enum SelectedOperation {
        case plus
        case minus
        case multiplication
        case division
        case equals
        case clearField
    }
    
    //MARK: - Properties
    //MARK: Private

    private var arrayOfValues: [Int] = []
    
    // MARK: - Actions
    
    @IBAction private func enterButtonZeroDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "0"
    }
    
    @IBAction private func enterButtonOneDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "1"
    }
    
    @IBAction private func enterButtonTwoDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "2"
    }
    
    @IBAction private func enterButtonThreeDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "3"
    }
    
    @IBAction private func enterButtonFourDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "4"
    }
    
    @IBAction private func enterButtonFiveDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "5"
    }
    
    @IBAction private func enterButtonSixDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "6"
    }
    
    @IBAction private func enterButtonSevenDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "7"
    }
    
    @IBAction private func enterButtonEightDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "8"
    }
    
    @IBAction private func enterButtonNineDidTapped(_ sender: Any) {
        mainOutputLabel.text! += "9"
    }
    
    @IBAction private func enterButtonPlusDidTapped(_ sender: Any) {
        let value = Int(mainOutputLabel.text ?? "") ?? 0
        arrayOfValues.append(value)
        updateOperation(operation: .plus)
    }
    
    @IBAction private func enterButtonMinusDidTapped(_ sender: Any) {
        updateOperation(operation: .minus)
    }
    
    @IBAction private func enterButtonEqualsDidTapped(_ sender: Any) {
        updateOperation(operation: .equals)
    }
    
    @IBAction private func enterButtonClearFieldDidTapped(_ sender: Any) {
        updateOperation(operation: .clearField)
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButtons()
    }
    
    // MARK: - Helpers
    private func roundedButtons() {
        // (AND &&) (OR ||)
        
        numbersOutletCollection.forEach { $0.roundedButton() } //🥤
        
        equalsOperationButton.roundedButton()
        plusOperationButton.roundedButton()
        minusOperationButton.roundedButton()
        clearFieldOperationButton.roundedButton()
    }

    
    private func updateOperation(operation: SelectedOperation) {
        switch operation {
        case .plus:
//            let value = Int(mainOutputLabel.text ?? "") ?? 0
//            arrayOfValues.append(value)
            mainOutputLabel.text = ""
            
        case .equals:
            var sum = 0
            let value = Int(mainOutputLabel.text ?? "") ?? 0
            arrayOfValues.append(value)
            for number in arrayOfValues {
                sum += number
            }
            mainOutputLabel.text = String(sum)
            arrayOfValues.removeAll()
        
        case .clearField:
            mainOutputLabel.text = ""
            arrayOfValues.removeAll()
        
        default:
            break
        }
    }
}

