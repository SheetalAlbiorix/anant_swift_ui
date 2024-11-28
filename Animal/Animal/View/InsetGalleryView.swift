//
//  InsetGalleryView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal : Animal
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment:.center,spacing: 8){
                ForEach(animal.gallery,id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider{
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View{
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
