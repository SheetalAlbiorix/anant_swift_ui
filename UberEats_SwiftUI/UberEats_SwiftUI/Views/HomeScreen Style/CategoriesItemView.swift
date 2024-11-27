//
//  CategoriesItemView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct CategoriesItemView: View {
    
    let category: Category
    
    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(category.name)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
       
    }
}


//#Preview {
//    CategoriesItemView()
//}
