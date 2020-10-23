//
//  Operators.swift
//  
//
//  Created by Sebastian Vidrea on 10/10/2020.
//

import Foundation
#if !os(macOS)
import UIKit
#endif

public func *(lhs: Int, rhs: CGFloat) -> CGFloat {
    return CGFloat(lhs) * rhs
}

public func *(lhs: CGFloat, rhs: Int) -> CGFloat {
    return lhs * CGFloat(rhs)
}
