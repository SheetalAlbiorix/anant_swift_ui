//
//  HomeView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 18/11/24.
//

import SwiftUI

struct HomeView: View {

    @State private var selectedOption: String = "Delivery"
    var restaurants = [Restaurant(imageGallery: "Product", namelbl: "Adenine Kitchen", deliverlbl: "$0.29 Delivery Fee.10-25min"),
                       Restaurant(imageGallery: "fastfood", namelbl: "Cardinal Chips", deliverlbl: "$0.29 Delivery Fee.10-25min"),
    ]
    var pictures = [Picture(pimages: "Promo Banner"),Picture(pimages: "Promo Banner"),Picture(pimages: "Promo Banner")]
    
    var restaurantss = [Restaurant(imageGallery: "IceCream", namelbl: "Ice Cream Bar", deliverlbl: "$0.29 Delivery Fee.10-25min"),
                        Restaurant(imageGallery: "dinner", namelbl: "Round Eatery", deliverlbl: "$0.29 Delivery Fee.10-25min"),
                        Restaurant(imageGallery: "African", namelbl: "African Flavour", deliverlbl: "$0.29 Delivery Fee.10-25min")
                        
    ]
    
    var body: some View {
        //MARK: Button (horizontal)
        ScrollView(showsIndicators: false){
            HStack{
                Spacer()
                Button {
                    selectedOption = "Delivery"
                    print("I've forgotten my password")
                    
                } label: {
                    Text("Delivery")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity) // Adjust button width to fill space
                        .background(selectedOption == "Delivery" ? Color.black : Color.white)
                        .foregroundColor(selectedOption == "Delivery" ? Color.white : Color.black)
                        .cornerRadius(100)
                    
                }
                
                Button {
                    selectedOption = "Pick-up"
                    print("I've forgotten my password")
                    
                } label: {
                    Text("Pick-up")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity) // Adjust button width to fill space
                        .background(selectedOption == "Pick-up" ? Color.black : Color.white)
                        .foregroundColor(selectedOption == "Pick-up" ? Color.white : Color.black)
                        .cornerRadius(100)
                    
                }
                Button {
                    selectedOption = "Dine-In"
                    print("I've forgotten my password")
                    
                } label: {
                    Text("Dine-In")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity) // Adjust button width to fill space
                        .background(selectedOption == "Dine-In" ? Color.black : Color.white)
                        .foregroundColor(selectedOption == "Dine-In" ? Color.white : Color.black)
                        .cornerRadius(100)
                }
                Spacer()
            }
            .padding()
            
            //MARK: -Setting View (Static)
            
              SettingView()
                .padding()
            
            //MARK: -CollectionView
            
              HomeCollectionView()
            
            //MARK: -ListView
            
            VStack(spacing: 16) {
                ForEach(restaurants) { restaurant in
                    Listview(restaurant: restaurant)
                }
            }
            .padding(.vertical)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 16) {
                    ForEach(pictures) { image in
                        Image(image.pimages)
                    }
                }
            }
            .padding(.vertical)
            
            VStack(spacing: 16) {
                ForEach(restaurantss) { restaurant in
                    Listview(restaurant: restaurant)
                }
            }
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
