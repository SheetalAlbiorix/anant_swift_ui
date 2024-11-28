//
//  ProductDetailView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var shop : Shop
    var body: some View {
        VStack(alignment: .leading,spacing: 5, content: {
            // Navi
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top,
                         UIApplication.shared.windows.first?.safeAreaInsets.top)
            // Header
            HeaderDetailView()
                .padding(.horizontal)
            
            // Detail top Part
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            // Detail botton Part
            VStack(alignment: .center ,spacing: 0, content: {
                // Rating + size
                RatingSizeDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                // Description
                ScrollView(.vertical,showsIndicators: false,content: {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body,design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                })
                
                // Quantity View
                QuantityFavDetailView()
                    .padding(.vertical,10)
                
                // Add to cart
                AddToCartView()
                    .padding(.bottom, 20)
                
                Spacer()
            })
            .zIndex(0)
            .padding(.horizontal)
            .background(Color.white
                .clipShape(CustomShape())
                .padding(.top,-105)
            )
            
        })
        .ignoresSafeArea(.all,edges: .all)
        .background(
            Color(
                red:shop.selectedProduct?.red ?? sampleProduct.red,
                green:shop.selectedProduct?.green ?? sampleProduct.green,
                blue :shop.selectedProduct?.blue ?? sampleProduct.blue
            )
            .ignoresSafeArea(.all,edges: .all)
        )
    }
}



struct ProductDetailView_Previews : PreviewProvider {
    static var previews: some View{
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
