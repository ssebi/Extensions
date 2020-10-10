//
//  UITextField.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

#if !os(macOS)
import UIKit

// MARK: - UITextField Extensions
public extension UITextField {

    /// Connects the passed `TextFields` which means that taping `next` on the keyboard
    /// will go to the next `TextField`. The last TextField will show `done` instead of `next`.
    /// - Parameter fields: The `TextFields` you want to connect.
    class func connectFields(fields: UITextField...) {
        guard let last = fields.last else { return }

        for index in 0 ..< fields.count - 1 {
            fields[index].returnKeyType = .next
            fields[index].addTarget(fields[index + 1],
                                action: #selector(UIResponder.becomeFirstResponder),
                                for: .editingDidEndOnExit)
        }

        last.returnKeyType = .done
        last.addTarget(last,
                       action: #selector(UIResponder.resignFirstResponder),
                       for: .editingDidEndOnExit)
    }

}
#endif
