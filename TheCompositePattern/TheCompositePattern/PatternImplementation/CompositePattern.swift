//
//  CompositePattern.swift
//  TheCompositePattern
//
//  Created by Praveen Jangre on 12/06/2025.
//

import Foundation


func fetchAppLaunchPath() {
    guard let path = CommandLine.arguments.first else {
        print("Current path not found")
        return
    }
    
    // Retrieve the application's folder
    let url = URL(fileURLWithPath: path, isDirectory: false)
    // Remove the file name from the path
    let dirPath = url.deletingLastPathComponent().relativePath
    let appLaunchFolder = Folder(name: dirPath, level: 0)
    print("Working directory: [\(appLaunchFolder.name)]")
    
    // Parse
    Parser.parse(folder: appLaunchFolder)
    print(appLaunchFolder)
}
