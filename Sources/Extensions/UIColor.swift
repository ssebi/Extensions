//
//  UIColor.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

#if !os(macOS)
import UIKit

// MARK: - UIColor Extensions
public extension UIColor {

    /// Initializes a `UIColor` from a given hex.
    /// - Parameter hex: The color hex.
    /// - Parameter alpha:Tthe alpha value (transparency).
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat(hex & 0x0000FF        ) / divisor

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
#endif
