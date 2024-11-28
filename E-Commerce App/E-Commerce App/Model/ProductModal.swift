//
//  ProductModal.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import Foundation


struct Product : Codable ,Identifiable {
    
    let id: Int
    let name : String
    let image : String
    let price : Int
    let description: String
    let color : [Double]
    
    // Computed Property
    
    var red : Double {return color[0] }
    var green : Double{return color[1] }
    var blue : Double {return color[2] }
    
    var formattedPrice : String { return "$\(price)"}
    
    
}
