import UIKit

extension UIButton {
    // Makes corner to the buttons
    func roundedButton() {
        layer.cornerRadius = frame.size.height / 3
    }
    
    // Makes indentation around the buttons
    func makeWhiteBorder(borderWidth: CGFloat) {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = borderWidth
    }
}
