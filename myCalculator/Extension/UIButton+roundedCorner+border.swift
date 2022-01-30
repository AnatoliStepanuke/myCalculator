import UIKit

extension UIButton {
    // MARK: - API
    func roundedButton() {
        layer.cornerRadius = frame.size.height / 3
    }
    func makeBorder(borderWidth: CGFloat) {
        layer.borderWidth = borderWidth
        layer.borderColor = AppColor.borderColor.cgColor
    }
    func fillBorderWithColor() {
        layer.borderColor = AppColor.borderColor.cgColor
    }
}
