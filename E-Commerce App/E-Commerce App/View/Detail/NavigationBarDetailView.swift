//
//  NavigationBarDetailView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeIn){
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                    
                }
                
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }
    }
}



struct NavigationBarDetailView_Previews : PreviewProvider {
    static var previews: some View{
        NavigationBarDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
