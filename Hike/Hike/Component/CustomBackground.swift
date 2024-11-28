//
//  CustomBackground.swift
//  Hike
//
//  Created by Anant Prajapati on 01/08/24.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        ZStack {
            // MARk :- DEPTH
            Color.CustomGreenDark
                .cornerRadius(40)
                .offset(x: 0, y: 12)
            
            // MARk :- LIGHT
            Color.CustomGreenLight
                .cornerRadius(40)
                .offset(x: 0, y: 3)
                .opacity(0.85)
            
            // MARk :- SURFACE
            LinearGradient(colors: [.CustomGreenLight,
                                    .CustomGreenMedium,
                                    ],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .cornerRadius(40)
        }
    }
 
}

#Preview {
    CustomBackground()
        .padding()
}
