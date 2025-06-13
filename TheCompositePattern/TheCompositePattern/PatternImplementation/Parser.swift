//
//  Parser.swift
//  TheCompositePattern
//
//  Created by Praveen Jangre on 13/06/2025.
//

import Foundation

struct Parser {
    static func parse(folder: Folder) {
        let fm = FileManager.default
        
        guard let enumerator = fm.enumerator(atPath: folder.name) else {
            print("No entries found ")
            return
        }
        
        var foldersByLevel = [0: folder] //initialize with 0 nesting level and the Folder received as argument
        
        // The while loop processes the objects returned by the enumerator object
        while let entryName = enumerator.nextObject() as? String {
            // Retrive the current parent folder
            guard let parentFolder = foldersByLevel[enumerator.level - 1] else { break }
            
            // Fetch the entry's size and type from the file attributes
            let size = enumerator.fileAttributes?[FileAttributeKey.size] as? Float
            let type = enumerator.fileAttributes?[FileAttributeKey.type] as? FileAttributeType
            
            // Create the matching instance based on the entry type
            switch type {
            case FileAttributeType.typeDirectory:
                let folder = Folder(name: entryName, level: enumerator.level)
                //We have a folder -> maintain the folderByLevel
                foldersByLevel[enumerator.level] = folder
                //Add the Folder instance to the parent folder's entries
                parentFolder.add(entry: folder)
            case FileAttributeType.typeRegular:
                let fileName = entryName.components(separatedBy: "/").last ?? entryName
                //Create the File instance and convert its size to MB
                let file = File(name: fileName, level: enumerator.level, size: (size ?? 0)/1024/1024)
                // Add the File instance to the parent folder's entries
                parentFolder.add(entry: file)
            default:
                break
            }
        }
    }
}
