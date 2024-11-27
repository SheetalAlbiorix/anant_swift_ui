//
//  Data.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import Foundation
import SwiftUI

struct Restaurant: Identifiable  {
    let id = UUID()
    let imageGallery : String
    let namelbl : String
    let deliverlbl : String
}

struct Picture : Identifiable {
    let id = UUID()
    let pimages : String
}


struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}
