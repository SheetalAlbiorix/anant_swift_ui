//
//  HeadlineView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct HeadlineView: View {
    var headlineImage : String
    var headlineText: String
    
    var body: some View {
        HStack{
            Image(systemName: headlineImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headlineText)
                .font(.title3)
                .fontWeight(.bold)
              
        }
        .padding(.vertical)
       
    }
}


struct HeadlineView_Previews : PreviewProvider{
    static var previews: some View{
        HeadlineView(headlineImage: "photo.on.rectangle.angled", headlineText: "wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
