import UIKit

final class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var mainOutputLabel: UILabel!
    
    @IBOutlet private var numbersOutletCollection: [UIButton]!
    @IBOutlet var operationsOutletCollection: [UIButton]!
    
    // MARK: - Inner type
    private enum MathOperation {
        case plus
        case minus
        case multiplication
        case division
        case clearField
        case none
    }
    
    //MARK: - Properties
    //MARK: Private

    private var arrayOfValues: [Int] = []
    private var selectedOperation: MathOperation = .none
    
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
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .plus
        mainOutputLabel.text = ""
    }
    
    @IBAction private func enterButtonMinusDidTapped(_ sender: Any) {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .minus
        mainOutputLabel.text = ""
    }
    
    @IBAction func enterButtonMultiplicationDidTapped(_ sender: Any) {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .multiplication
        mainOutputLabel.text = ""
    }
    
    @IBAction func enterButtonDivisionDidTapped(_ sender: Any) {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .division
        mainOutputLabel.text = ""
    }
    
    @IBAction private func enterButtonEqualsDidTapped(_ sender: Any) {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        calculateResult()
        arrayOfValues.removeAll()
    }
    
    @IBAction private func enterButtonClearFieldDidTapped(_ sender: Any) {
        mainOutputLabel.text = ""
        arrayOfValues.removeAll()
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButtons()
    }
    
    // MARK: - Helpers
    
    private func calculateResult() {
        switch selectedOperation {
        case .plus:
            var result = 0
            arrayOfValues.forEach { i in
                result += i
            }
            mainOutputLabel.text = "\(result)"
            
        case .minus:
            var result = 0
            var tmp = 0
            var counter = 0
            arrayOfValues.forEach { i in
                if counter == 0 {
                    tmp = i
                } else {
                    result = tmp - i
                }
                counter += 1
            }
            mainOutputLabel.text = "\(result)"
            
        case .multiplication:
            var result = 1
            arrayOfValues.forEach { i in
                result *= i
            }
            mainOutputLabel.text = "\(result)"
            
        case .division:
            var result = 0
            var counter = 0
            var tmp = 0
            arrayOfValues.forEach { i in
                if counter == 0 {
                    tmp = i
                } else {
                    result = tmp / i
                }
                counter += 1
            }
            mainOutputLabel.text = "\(result)"
            
        case .clearField: mainOutputLabel.text = ""
        case .none: break
        }
    }
    
    private func roundedButtons() {
        // (AND &&) (OR ||)
        
        numbersOutletCollection.forEach { $0.roundedButton() } //🥤
        operationsOutletCollection.forEach { $0.roundedButton() }
    }
}

