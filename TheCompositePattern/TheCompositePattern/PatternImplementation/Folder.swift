//
//  Folder.swift
//  TheCompositePattern
//
//  Created by Praveen Jangre on 13/06/2025.
//

import Foundation

class Folder: FileSystemEntry {
    private var entries = [FileSystemEntry]()
    
    let name: String
    let level: Int
    
    init(name: String, level: Int) {
        self.name = name
        self.level = level
    }
    func add(entry: FileSystemEntry) {
        entries.append(entry)
    }
    
    var size: Float {
        entries.reduce(0){$0 + $1.size}
    }
    
}

extension Folder: CustomStringConvertible {
    var description: String {
        let indent = String(repeating: "\t", count: level)
        var result = "\(indent)[\(name.uppercased())] \(String(format: "%.3f", size)) MB"
        for entry in entries {
            result += "\n\(entry)"
        }
        return result
    }
}
