//
//  FeatureTabView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct FeatureTabView: View {
    var body: some View {
        
        TabView{
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct FeatureTabView_Previews : PreviewProvider {
    static var previews: some View {
        FeatureTabView()
            .background(Color.gray)
    }
}
