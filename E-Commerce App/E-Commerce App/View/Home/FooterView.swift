//
//  FooterView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment :.center ,spacing: 10){
            Text("All sport helmet available with Special and Affordable Discount.And get special offer in varity of helmet")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
                .layoutPriority(0)
            
            Text("Copyright © Anant Prajapati\n All rights reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        }
        .padding()
    }
}

struct FooterView_Previews : PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
