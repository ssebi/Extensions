//
//  File.swift
//  
//
//  Created by Sebastian Vidrea on 02/10/2020.
//

import Foundation

public extension Sequence where Element: Numeric {

    var sum: Element {
        reduce(0, +)
    }

    var product: Element {
        reduce(1, *)
    }
}

public extension Sequence {

    func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return false
            }
        }
        return true
    }

    func count(where predicate: (Element) -> Bool) -> Int {
        var count = 0
        for element in self {
            if predicate(element) {
                count += 1
            }
        }
        return count
    }

    func uniqueElements(by elementsEqual: (Element, Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(where: { resultElement in elementsEqual(element, resultElement) }) {
                result.append(element)
            }
        }
        return result
    }

    func sorted<T: Comparable>(on propertyAccessor: (Element) -> T) -> [Element] {
        return sorted(by: { propertyAccessor($0) < propertyAccessor($1) })
    }

}

public extension Sequence where Element: Equatable {
    func uniqueElements() -> [Element] {
        return uniqueElements(by: ==)
    }
}
