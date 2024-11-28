//
//  CodableDataModal.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import Foundation


extension Bundle {
    
    func decode<T:Codable>(_ file : String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to Locate \(file) in Bundle ")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to \(file) get data")
        }
        
        let decoder = JSONDecoder()
        
         guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to load\(file) file")
        }
        return loaded
    }
}
