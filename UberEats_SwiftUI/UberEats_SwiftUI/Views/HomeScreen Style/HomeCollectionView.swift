//
//  HomeCollectionView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct HomeCollectionView: View {
    
    @State private var showingSheet = false

    var body: some View {
       
            HStack{
                HStack{
                    
                    Text("American")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .bottomLeading)
                        .padding()
                    VStack{
                        Image("hotdog")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50,alignment: .topTrailing)
                            .padding(.top,5)
                            .padding(.horizontal,5)
                        Spacer()
                    
                    }
                    
                }
                .frame(width: 175,height: 90)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
               
                
                HStack{
                    
                    Text("Grocery")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .bottomLeading)
                        .padding()
                    VStack{
                        Image("grocery")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40,alignment: .topTrailing)
                            .padding(.top,5)
                            .padding(.horizontal,5)
                        Spacer()
                    
                    }
                }
                .frame(width: 175,height: 90)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            }
            .padding(.horizontal,20)
            
            HStack{
                
                VStack{
                    Image("convenience")
                        .frame(width: 84,height: 84)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(5)
                    
                    Text("convenience")
                        .font(.caption)
                    
                }
              
                VStack{
                    Image("alcohol")
                        .frame(width: 84,height: 84)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(5)
                    Text("Alochol")
                        .font(.caption)
                }
                
                
                VStack{
                    Image("petsupplies")
                        .frame(width: 84,height: 84)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(5)
                        
                    Text("Petsupply")
                        .font(.caption)
                    
                    
                }
            
                VStack{
                    Button {
                        print("More")
                        showingSheet.toggle()
                    } label: {
                        VStack{
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 30, maxHeight: 20)
                            
                        }
                        .padding()
                        .foregroundColor(.black)
                        .sheet(isPresented: $showingSheet) {
                            CategoriesView()
                        }
                    }
                    .frame(width: 84,height: 84)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(5)
                    
                    Text("More")
                        .font(.caption)
                }
                
            }
            .padding(.horizontal,20)
        }
    }


#Preview {
    HomeCollectionView()
}
