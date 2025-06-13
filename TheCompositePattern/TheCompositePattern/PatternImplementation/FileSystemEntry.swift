//
//  FileSystemEntry.swift
//  TheCompositePattern
//
//  Created by Praveen Jangre on 13/06/2025.
//

import Foundation

protocol FileSystemEntry {
    var name: String {get}
    var size: Float {get}
    var level: Int {get}
}


