//
//  UIImage.swift
//  
//
//  Created by Sebastian Vidrea on 10/10/2020.
//

#if !os(macOS)
import UIKit

extension UIImage {

    var aspectRatio: CGFloat {
        return size.width / size.height
    }

}
#endif
