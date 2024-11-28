//
//  RecipeModal.swift
//  Avacado
//
//  Created by Anant Prajapati on 17/09/24.
//

import Foundation
import SwiftUI

struct Recipe : Identifiable {
    var id = UUID()
    var title : String
    var headline : String
    var image : String
    var rating : Int
    var serves : Int
    var preparation : Int
    var cooking : Int
    var instructions : [String]
    var ingredients : [String]
    
    
}
