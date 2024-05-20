//
//  JSONLoader.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

class JSONLoader {
    static func loadJSONData(from fileName: String) -> Data? {
        guard let jsonFileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("JSON file not found.")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonFileURL)
            return jsonData
        } catch {
            print("Error loading JSON data: \(error)")
            return nil
        }
    }
}
