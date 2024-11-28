//
//  CoverImageView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct CoverImageView: View {
    // Properties :-
    let coverImage : [CoverImage] = Bundle.main.decode("covers.json")
    
    
    var body: some View {
        TabView{
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
