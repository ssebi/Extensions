//
//  Array.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

import Foundation

// MARK: - Array Extensison
public extension Array {

    /// Returns the element at a given index.
    /// Safe alternative for subscripting (eg. `arr[0]`)
    /// - Parameter index: Index of the element you want.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}

public extension Array where Element: BinaryFloatingPoint {

    var average: Element {
        return self.reduce(0, +) / Element(self.count)
    }

}
