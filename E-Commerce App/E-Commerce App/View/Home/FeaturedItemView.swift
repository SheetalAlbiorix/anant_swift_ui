//
//  FeaturedItemView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct FeaturedItemView: View {
    
    let player : Player
    
    var body: some View {
        
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
    }
}

struct FeaturedItemView_Previews : PreviewProvider {
    static var previews: some View {
        FeaturedItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
