//
//  AnimalModal.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//


import SwiftUI


struct Animal: Codable,Identifiable{
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}
