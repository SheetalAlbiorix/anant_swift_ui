//
//  Constant.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories : [Category] = Bundle.main.decode("category.json")
let product: [Product] = Bundle.main.decode("product.json")
let brands : [Brand] = Bundle.main.decode("brand.json")
let sampleProduct : Product = product[0]

// COLOR
let colorBackground : Color = Color("ColorBackground")
let colorGray : Color = Color(UIColor.systemGray4)

//LAYOUT
let coloumnSpacing: CGFloat = 10
let rowSpacing : CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}

// UX

// API


// IMAGE

// FONT

// STRING

//MISC


