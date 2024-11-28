//
//  GalleryView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal : String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
//    let gridLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        
        ScrollView(.vertical , showsIndicators: false){
            VStack(alignment: .center ,spacing: 30){
                HStack{
                    Text("Gallery")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                      }
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                LazyVGrid(columns: gridLayout,alignment: .center,spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }
            }
            
            .padding(.horizontal,10)
            .padding(.vertical,50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}


struct GalleryView_Previews:PreviewProvider{
    static var previews: some View{
        GalleryView()
    }
}
