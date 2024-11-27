//
//  WelcomeView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 14/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigateToHomeScreen = false

    var body: some View {
        
       
            VStack(spacing:20){
                //MARK: -Image
                Spacer()
                HStack{
                    Image("All Set")
                    Spacer()
                }
                .padding(.horizontal)
                
                //MARK: -Label
                HStack{
                    Text("All Set.")
                        .font(.system(size: 25,weight: .medium,design: .default))
                    Spacer()
                }
                .padding(.horizontal,20)
                //MARK: -Label
                
                HStack{
                    Text("You'll be signed into your account in a moment.If nothing happens,click continue")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        
                }
                .padding()
                //MARK: -Button (Continue)
                HStack{
                    Button {
                        print("Continue")
                        navigateToHomeScreen = true
                    } label: {
                        HStack{
                            Text("Continue")
                                .font(.title2)
                                .fontWeight(.medium)
                            Image(systemName: "arrow.right")
                            
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(100)
                    }
                    
                    Spacer()
                }
                
                .padding()
                NavigationLink(destination: HomeView(), isActive: $navigateToHomeScreen) {

                }
                Spacer()
                Spacer()
                Spacer()
                
            }
           
        }
    }

#Preview {
    WelcomeView()
}
