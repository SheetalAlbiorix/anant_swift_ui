//
//  LogoView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 11/09/24.
//

import SwiftUI

struct LogoView: View {
    
    var body: some View {
        HStack{
            Text("Touch".uppercased())
                .font(.title)
                .fontWeight(.medium)
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30,alignment: .center)
            Text("Down".uppercased())
                .font(.title)
                .fontWeight(.medium)
        }
    }
}

struct LogoView_Previews : PreviewProvider {
    static var previews: some View {
       LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
