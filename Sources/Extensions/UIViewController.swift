//
//  UIViewController.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

#if !os(macOS)
import UIKit

// MARK: - UIViewController extensions
public extension UIViewController {

    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }

    /// Adds a child `ViewController`.
    /// - Parameter child: Child `ViewController` to add.
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    /// Removes the `ViewController` as a chiild.
    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

}

// MARK: - UIGestureRecognizerDelegate
extension UIViewController: UIGestureRecognizerDelegate {

    /// Hides the keyboard when anywhere on the screen.
    func hideKeyboardWhenTappingAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                   shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIButton {
            return false
        }
        return true
    }

}
#endif
