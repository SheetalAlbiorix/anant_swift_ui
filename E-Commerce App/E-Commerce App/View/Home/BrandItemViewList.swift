//
//  BrandItemViewList.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct BrandItemViewList: View {
    
    let brand : Brand
    
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12).stroke(.gray,lineWidth: 2)
            )
    }
}


struct BrandItemViewList_Previews : PreviewProvider {
    static var previews: some View{
        BrandItemViewList(brand: brands[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
