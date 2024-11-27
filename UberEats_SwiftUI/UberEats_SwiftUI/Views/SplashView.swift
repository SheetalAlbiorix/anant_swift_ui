//
//  SplashView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 11/11/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive : Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                MainView()
            }else{
                Rectangle()
                    .background(Color.black)
                
                Image("UberEats")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
