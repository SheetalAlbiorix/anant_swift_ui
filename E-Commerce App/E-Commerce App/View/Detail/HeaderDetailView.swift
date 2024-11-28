//
//  HeaderDetailView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct HeaderDetailView: View {
    
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6, content: {
            Text("Protective Gear")
            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.title)
                .fontWeight(.black)
        })
        .foregroundColor(.white)
        
    }
}


struct HeaderDetailView_Previews : PreviewProvider {
    static var previews: some View{
        HeaderDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
