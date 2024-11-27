//
//  CategoriesView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct CategoriesView: View {
    
    let categories = [
           Category(name: "Convenie", imageName: "convenience"),
           Category(name: "Alcohol", imageName: "alcohol"),
           Category(name: "PetSupply", imageName: "petsupplies"),
           Category(name: "Flowers", imageName: "Flower"),
           Category(name: "Grocery", imageName: "grocery"),
           Category(name: "French", imageName: "French"),
           Category(name: "Foods", imageName: "fastfood 1"),
           Category(name: "Chinese", imageName: "chinese"),
           Category(name: "Flowers", imageName: "Flower"),
           Category(name: "Grocery", imageName: "grocery"),
           Category(name: "French", imageName: "French"),
           Category(name: "Convenie", imageName: "convenience"),
           Category(name: "Alcohol", imageName: "alcohol"),
           Category(name: "PetSupply", imageName: "petsupplies"),
           Category(name: "Chinese", imageName: "chinese"),
           Category(name: "Flowers", imageName: "Flower"),
           Category(name: "Grocery", imageName: "grocery"),
           Category(name: "Chinese", imageName: "chinese"),
           Category(name: "Flowers", imageName: "Flower"),
           Category(name: "Grocery", imageName: "grocery")
       ]
       
       let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
       ]

    var body: some View {
        ScrollView{
            VStack{
                Text("All Categories")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(categories) { category in
                        CategoriesItemView(category: category)
                    }
                }
            }
            .padding()
        }
    }
        
}

#Preview {
    CategoriesView()
}
