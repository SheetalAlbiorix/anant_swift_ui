//
//  AnimalDetailView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment:.center,spacing: 20){
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                // Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //Gallery
                Group{
                    HeadlineView(headlineImage: "photo.on.rectangle.angled", headlineText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                //Facts
                Group{
                    HeadlineView(headlineImage: "questionmark.circle", headlineText: "Did you Know")
                    InsetFactView(animal: animal)
                    
                }
                .padding(.horizontal)
                //description
                Group{
                    HeadlineView(headlineImage: "info.circle", headlineText: "All about \(animal.name)")
                    DescriptionView(animal: animal)
                }
                .padding(.horizontal)
                
                //Map
                Group{
                    HeadlineView(headlineImage: "map", headlineText: "National Park")
                    MapDetailView()
                }
                
                // link
                Group{
                    HeadlineView(headlineImage: "books.vertical", headlineText: "Learn More")
                   WebLinkView(animal: animal)
                }
                
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
      
    }
}

struct AnimalDetailView_Previews: PreviewProvider{
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View{
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
    }
}
