//
//  Int.swift
//  
//
//  Created by Sebastian Vidrea on 10/10/2020.
//

import Foundation

public extension Int {

    var times: [Void] {
        return (0..<self).map { _ in return () }
    }

}
