//
//  NavigationBarView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK : Properties
    @State private var isAnimated : Bool = false
    
    
    // MARK : Body
    var body: some View {
    
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.light)
            })
            Spacer()
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0 , y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            Image(systemName: "cart")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.light)
        }
    }
}

struct NavigationBarView_Previews : PreviewProvider {
    static var previews: some View {
       NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
