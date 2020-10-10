//
//  UIStoryboard.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

#if !os(macOS)
import UIKit

// MARK: - UIStoryboard Extensions
public extension UIStoryboard {

    /// Instantiates a ViewController of the specified type.
    /// (Make sure to also set the storyboard ID before calling this functions)
    /// - Parameter type: Type of the View Controller (eg. ViewController.self)
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        let identifier = String(describing: type)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Cannot instantiate view controller")
        }

        return viewController
    }

}
#endif
