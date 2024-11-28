//
//  BrandGridView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct BrandGridView: View {
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false,content: {
            LazyHGrid(rows: gridLayout,spacing: coloumnSpacing, content: {
                ForEach(brands) { brand in
                    BrandItemViewList(brand: brand)
                    
                }
            })
            .frame(height: 200)
            .padding(15)
        })
        
    }
}

struct BrandGridView_Previews : PreviewProvider {
    static var previews: some View{
       BrandGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
