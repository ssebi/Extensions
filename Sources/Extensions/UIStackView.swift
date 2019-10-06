//
//  UIStackView.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

import UIKit

// MARK: - UIStackView Extensions
@available(iOS 9.0, *)
public extension UIStackView {

    private struct Constants {
        static let duration: TimeInterval = 0.3
        static let springDamping: CGFloat = 0.75
        static let initialSpringVelocity: CGFloat = 0.8
        static let delay: TimeInterval = 0.0
    }

    /// Remove all views inside the stack.
    /// - Parameter animated: Add an animation when removing them?.
    func removeAll(animated: Bool) {
        for view in arrangedSubviews.reversed() {
            guard animated else {
                removeArrangedSubviewFromSuperview(view)
                return
            }

            UIView.animate(withDuration: Constants.duration, animations: {
                view.alpha = 0
                view.isHidden = true
            }, completion: { completed in
                if completed {
                    self.removeArrangedSubviewFromSuperview(view)
                }
            })
        }
    }

    /// Removes the view from both the `UIStackView` and its `superview`.
    /// - Parameter view: `UIView` instance to be removed.
    func removeArrangedSubviewFromSuperview(_ view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    /// Adds an arranged subview to a given position.
    /// - Parameter view: `UIView` instance to add.
    /// - Parameter position: The position where to be added.
    /// - Parameter animated: Insert the view with animation?
    func insertArrangedSubview(_ view: UIView, at position: Int? = nil, animated: Bool) {
        view.alpha = 0
        view.isHidden = true

        if let position = position {
            insertArrangedSubview(view, at: position)
        } else {
            addArrangedSubview(view)
        }

        guard animated else { return }

        UIView.animate(withDuration: Constants.duration,
                       delay: Constants.delay,
                       usingSpringWithDamping: Constants.springDamping,
                       initialSpringVelocity: Constants.initialSpringVelocity,
                       options: .curveEaseInOut,
                       animations: { view.isHidden = false; view.alpha = 1; self.layoutIfNeeded() },
                       completion: nil)
    }

}

