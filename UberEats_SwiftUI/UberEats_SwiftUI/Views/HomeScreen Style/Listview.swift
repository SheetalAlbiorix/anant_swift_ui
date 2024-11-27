//
//  Listview.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct Listview: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        VStack{
            HStack {
                Image(restaurant.imageGallery)
                    .resizable()
                    .scaledToFit()
                    
            }
            .padding(.horizontal)
            HStack {
                Text(restaurant.namelbl)
                    .font(.title2)
                Spacer()
                Text("4.3")
                    .font(.callout)
                    .frame(width: 30,height: 30)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(20)
                
            }
            .padding(.horizontal,20)
            HStack{
                Text(restaurant.deliverlbl)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal,20)
        }
    }
}

//#Preview {
//    Listview(restaurant: <#Restaurant#>)
//}
