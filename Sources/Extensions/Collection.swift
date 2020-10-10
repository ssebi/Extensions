//
//  Collection.swift
//  
//
//  Created by Sebastian Vidrea on 06/10/2019.
//

import Foundation

extension Collection {

    /// Safetly subscripts a collection `Element`.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}

extension Collection where SubSequence: Collection {

    func chunks(size: Int) -> [SubSequence] {
        let chunk = self.prefix(size)
        if chunk.isEmpty { return [] }
        let rest = self.dropFirst(size)
        return [chunk] + rest.chunks(size: size)
    }

}
