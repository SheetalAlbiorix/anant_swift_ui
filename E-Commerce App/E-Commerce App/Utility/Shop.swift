//
//  Shop.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import Foundation

class Shop: ObservableObject{
    @Published var showingProduct : Bool = false
    @Published var selectedProduct : Product? = nil
}
