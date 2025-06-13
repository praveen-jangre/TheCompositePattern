//
//  File.swift
//  TheCompositePattern
//
//  Created by Praveen Jangre on 13/06/2025.
//

import Foundation

class File: FileSystemEntry {
    let name: String
    let level: Int
    let size: Float
    
    init(name: String, level: Int, size: Float) {
        self.name = name
        self.level = level
        self.size = size
    }
}


extension File: CustomStringConvertible {
    var description: String {
        let indent = String(repeating: "\t", count: level)
        return "\(indent) - \(name) \(String(format: "%.3f", size)) MB)"
    }
}
