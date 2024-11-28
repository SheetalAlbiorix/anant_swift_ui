//
//  AddToCartView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct AddToCartView: View {
    
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2,design : .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
                
        })
        .padding(15)
        .background(
            Color(red:shop.selectedProduct?.red ?? sampleProduct.red,
                  green: shop.selectedProduct?.green ?? sampleProduct.green,
                  blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        )
        .clipShape(Capsule())
    }
}



struct AddToCartView_Previews : PreviewProvider {
    static var previews: some View{
        AddToCartView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
