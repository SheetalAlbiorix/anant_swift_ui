//
//  VideoModal.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct Video : Codable,Identifiable {
     
    let id : String
    let name : String
    let headline : String
    
   // Computed Property
    
    var thumbnail : String {
        "video-\(id)"
    }
    
}
