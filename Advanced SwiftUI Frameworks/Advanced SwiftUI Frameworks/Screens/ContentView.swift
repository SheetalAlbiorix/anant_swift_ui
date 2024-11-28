//
//  ContentView.swift
//  Advanced SwiftUI Frameworks
//
//  Created by Anant Prajapati on 05/08/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive : Bool = true
    
    var body: some View {
        ZStack{
            if isOnBoardingViewActive{
                OnBoardingView()
            }else{
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
