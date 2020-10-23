//
//  Data.swift
//  
//
//  Created by Sebastian Vidrea on 10/10/2020.
//

import Foundation

public extension Data {

    var hexString: String {
        return self
            .map { (data: UInt8) in
                return String(format: "%02hhx", data)
            }
            .joined()
    }

}
