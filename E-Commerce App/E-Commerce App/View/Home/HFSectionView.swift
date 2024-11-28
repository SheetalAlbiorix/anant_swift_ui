//
//  HFSectionView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct HFSectionView: View {
    
    @State var rotateClockWise : Bool
    
    var body: some View {
        VStack(spacing: 10){
            
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockWise ? 90 : -90))
            
            Spacer()
        }
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
        
    }
}

struct HFSectionView_Previews : PreviewProvider {
    static var previews: some View {
        HFSectionView(rotateClockWise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
