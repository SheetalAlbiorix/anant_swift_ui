//
//  CategoryGridView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false,content: {
            LazyHGrid(rows: gridLayout,alignment: .center, spacing: coloumnSpacing,pinnedViews: [], content: {
                Section(
                    header: HFSectionView(rotateClockWise: false),
                    footer: HFSectionView(rotateClockWise: true)
                
                ){
                    ForEach(categories){ category in
                        CategoryItemView(category: category)
                    }
                }
            })
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical,10)
        })
        
    }
}

struct CategoryGridView_Previews : PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)

    }
}
