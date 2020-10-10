//
//  UIView.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

#if !os(macOS)
import UIKit

// MARK: - UIView Extensions
public extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach { (view: UIView) in
            self.addSubview(view)
        }
    }

}
#endif
