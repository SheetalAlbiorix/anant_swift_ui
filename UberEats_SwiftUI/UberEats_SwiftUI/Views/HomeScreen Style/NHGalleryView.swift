//
//  NHGalleryView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct NHGalleryView: View {
    
    let picture: Picture
    
    var body: some View {
        HStack(alignment:.center,spacing: 8){
            Image(picture.pimages)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                   .cornerRadius(10)
        }
    }
}

//#Preview {
//    NHGalleryView(picture: )
//}
