//
//  TitleView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct TitleView: View {
    
    let title : String
    var body: some View {

        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom,10)
    }
}

struct TitleView_Previews : PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
