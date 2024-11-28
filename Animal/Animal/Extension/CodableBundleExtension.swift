//
//  CodableBundleExtension.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import Foundation



extension Bundle{
    
    func decode<T: Codable>(_ file : String) -> T {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("failed to locate\(file) in Bundle")
        }
                
        // 2. Create a property for the Data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("failed to create\(file) property")
        }
        
        // 3. Create decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for decode data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("failed to \(file) decode data")
        }
        
        // 5. Return ready to use-to-use
        return loaded
    }
}

