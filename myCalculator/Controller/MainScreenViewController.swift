import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var mainOutputLabel: UILabel!
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
    
    // MARK: - Properties
    // MARK: Private
    private var arrayOfValues: [Int] = []
    private var selectedOperation: MathOperation = .none
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButtons()
        setupButtonActions()
        bufferAroundButtons()
    }
    
    // MARK: - Setups
    private func setupButtonActions() {
        numbersOutletCollection.enumerated().forEach { index, button in
            button.tag = index
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
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
    
    // MARK: - Helpers
    private func calculateResult() {
        switch selectedOperation {
        case .plus:
            var result = 0
            arrayOfValues.forEach { value in
                result += value
            }
            mainOutputLabel.text = "\(result)"
            
        case .minus:
            var result = 0
            var tmp = 0
            var counter = 0
            arrayOfValues.forEach { value in
                if counter == 0 {
                    tmp = value
                } else {
                    result = tmp - value
                }
                counter += 1
            }
            mainOutputLabel.text = "\(result)"
            
        case .multiplication:
            var result = 1
            arrayOfValues.forEach { value in
                result *= value
            }
            mainOutputLabel.text = "\(result)"
            
        case .division:
            var result = 0
            var counter = 0
            var buffer = 0
            
            arrayOfValues.forEach { value in
                if counter == 0 {
                    buffer = value
                } else if value == 0 {
                    mainOutputLabel.text = "error."
                } else {
                    result = buffer / value
                    mainOutputLabel.text = "\(result)"
                }
                counter += 1
            }
        case .clearField: mainOutputLabel.text = ""
        case .none: break
        }
    }
    
    private func roundedButtons() {
        (numbersOutletCollection + operationsOutletCollection).forEach { $0.roundedButton() } // 🥤
    }
    
    private func bufferAroundButtons() {
        (numbersOutletCollection + operationsOutletCollection).forEach {
            $0.makeWhiteBorder(borderWidth: 3.0)
        }
    }
    
    // MARK: - Objc methods
    @objc private func buttonClicked(sender: UIButton) {
        if mainOutputLabel.text != nil { mainOutputLabel.text! += String(sender.tag) }
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
