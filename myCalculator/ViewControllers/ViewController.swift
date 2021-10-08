import UIKit

final class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var mainOutputLabel: UILabel!
    
    @IBOutlet private var numbersOutletCollection: [UIButton]!
    @IBOutlet private var operationsOutletCollection: [UIButton]!
    
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButtons()
        setupButtonActions()
    }
    
    // MARK: - Helpers
    private func setupButtonActions() {
        numbersOutletCollection.forEach { buttonNumber in
            switch buttonNumber.tag {
            case 0:
                buttonNumber.addTarget(self, action: #selector(zeroDidTapped), for: .touchUpInside)
            case 1:
                buttonNumber.addTarget(self, action: #selector(oneDidTapped), for: .touchUpInside)
            case 2:
                buttonNumber.addTarget(self, action: #selector(twoDidTapped), for: .touchUpInside)
            case 3:
                buttonNumber.addTarget(self, action: #selector(threeDidTapped), for: .touchUpInside)
            case 4:
                buttonNumber.addTarget(self, action: #selector(fourDidTapped), for: .touchUpInside)
            case 5:
                buttonNumber.addTarget(self, action: #selector(fiveDidTapped), for: .touchUpInside)
            case 6:
                buttonNumber.addTarget(self, action: #selector(sixDidTapped), for: .touchUpInside)
            case 7:
                buttonNumber.addTarget(self, action: #selector(sevenDidTapped), for: .touchUpInside)
            case 8:
                buttonNumber.addTarget(self, action: #selector(eightDidTapped), for: .touchUpInside)
            case 9:
                buttonNumber.addTarget(self, action: #selector(nineDidTapped), for: .touchUpInside)
            default:
                break
            }
        }
        
        operationsOutletCollection.forEach { buttonOperation in
            switch buttonOperation.tag {
            case 10:
                buttonOperation.addTarget(self, action: #selector(plusDidTapped), for: .touchUpInside)
            case 11:
                buttonOperation.addTarget(self, action: #selector(minusDidTapped), for: .touchUpInside)
            case 12:
                buttonOperation.addTarget(self, action: #selector(multiplicationDidTapped), for: .touchUpInside)
            case 13:
                buttonOperation.addTarget(self, action: #selector(divisionDidTapped), for: .touchUpInside)
            case 14:
                buttonOperation.addTarget(self, action: #selector(clearFieldDidTapped), for: .touchUpInside)
            case 15:
                buttonOperation.addTarget(self, action: #selector(equalDidTapped), for: .touchUpInside)
            default:
                break
            }
        }
    }
    
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
            
            arrayOfValues.forEach { value in
                if counter == 0 {
                    tmp = value
                } else if value == 0 {
                    mainOutputLabel.text = "can't divide by zero."
                } else {
                    result = tmp / value
                    mainOutputLabel.text = "\(result)"
                }
                counter += 1
            }
            
        case .clearField: mainOutputLabel.text = ""
        case .none: break
        }
    }
    
    private func roundedButtons() {
        // (AND &&) (OR ||)
        
        numbersOutletCollection.forEach { $0.roundedButton() } //🥤
        operationsOutletCollection.forEach { $0.roundedButton() }
    }
    
    @objc private func zeroDidTapped() {
        mainOutputLabel.text! += "0"
    }
    
    @objc private func oneDidTapped() {
        mainOutputLabel.text! += "1"
    }
    
    @objc private func twoDidTapped() {
        mainOutputLabel.text! += "2"
    }
    
    @objc private func threeDidTapped() {
        mainOutputLabel.text! += "3"
    }
    
    @objc private func fourDidTapped() {
        mainOutputLabel.text! += "4"
    }
    
    @objc private func fiveDidTapped() {
        mainOutputLabel.text! += "5"
    }
    
    @objc private func sixDidTapped() {
        mainOutputLabel.text! += "6"
    }
    
    @objc private func sevenDidTapped() {
        mainOutputLabel.text! += "7"
    }
    
    @objc private func eightDidTapped() {
        mainOutputLabel.text! += "8"
    }
    
    @objc private func nineDidTapped() {
        mainOutputLabel.text! += "9"
    }
    
    @objc private func plusDidTapped() {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .plus
        mainOutputLabel.text = ""
    }
    
    @objc private func minusDidTapped() {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .minus
        mainOutputLabel.text = ""
    }
    
    @objc private func multiplicationDidTapped() {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .multiplication
        mainOutputLabel.text = ""
    }
    
    @objc private func divisionDidTapped() {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        selectedOperation = .division
        mainOutputLabel.text = ""
    }
    
    @objc private func clearFieldDidTapped() {
        mainOutputLabel.text = ""
        arrayOfValues.removeAll()
    }
    
    @objc private func equalDidTapped() {
        arrayOfValues.append(Int(mainOutputLabel.text ?? "") ?? 0)
        calculateResult()
        arrayOfValues.removeAll()
    }
}

