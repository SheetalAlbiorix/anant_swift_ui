//
//  ProductListView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct ProductListView: View {
    
    let product : Product
    
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 6, content: {
               //Photo
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(Color(red: product.red,green: product.green ,blue: product.blue))
            .cornerRadius(12)
              // Name
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
              // Price
            Text("\(product.formattedPrice)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
        })
        
    }
}

struct ProductListView_Previews : PreviewProvider {
    
    static let products : [Product] = Bundle.main.decode("product.json")
    
    static var previews: some View {
        ProductListView(product: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
