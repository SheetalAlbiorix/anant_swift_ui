//
//  RecipeCardView.swift
//  Avacado
//
//  Created by Anant Prajapati on 17/09/24.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe : Recipe
    var hepticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal : Bool = false
    
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack{
                        Spacer()
                        VStack{
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x:0 , y: 0)
                                .padding(.trailing,20)
                                .padding(.top, 22)
                            Spacer()
                        }
                    })
            VStack(alignment: .leading,spacing: 12){
                //title
                Text(recipe.title)
                    .font(.system(.title ,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                //Headline
                Text(recipe.headline)
                    .font(.system(.title3,design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                //Rates
                
                 RecipeRatingView(recipe: recipe)
                
                //Cooking
                 
                RecipeCookingView(recipe: recipe)
                
            }
            .padding()
            .padding(.bottom,12)
            
        }
       
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x:0 , y: 0)
        .onTapGesture {
            self.hepticImpact.impactOccurred()
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal){
            RecipeDetailView(recipe: self.recipe)
        }
    }
    
}

struct RecipeCardView_Previews : PreviewProvider {
    static var previews: some View{
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
