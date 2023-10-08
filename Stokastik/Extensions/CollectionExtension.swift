//
//  CollectionExtension.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 28.09.2023.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
