//
//  HomeView.swift
//  Advanced SwiftUI Frameworks
//
//  Created by Anant Prajapati on 05/08/24.
//

import SwiftUI

struct HomeView: View {
    // Mark : Properties
    @AppStorage("onboarding") var isOnboardingActive : Bool = false
    @State var isAnimating : Bool = false
 
    // Mark: BODY
    var body: some View {
       
            VStack(spacing : 20) {
                // MARK: HEADER
                
                Spacer()
               
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y : isAnimating ? 35 : -35)
                        .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                        value: isAnimating
                        
                        
                        )
                }
               
                //MARK: Centre
                
            Text("The time that lead to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //MARK: FOOTER
               Spacer()
                
                Button(action: {
                    // Some Action
                    withAnimation{
                        isOnboardingActive = true
                    }
                 
                    
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text ("Restart")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                    
                }// End of button
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                
            }// END OF Vstack
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    isAnimating = true
                })
            
            })
    }
}

#Preview {
    HomeView()
}
