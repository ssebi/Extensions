//
//  UIGestureRecognizer.swift
//  
//
//  Created by Sebastian Vidrea on 10/10/2020.
//

#if !os(macOS)
import UIKit

extension UIGestureRecognizer {

    func cancel() {
        let oldValue = isEnabled
        isEnabled = false
        isEnabled = oldValue
    }
    
}

#endif
