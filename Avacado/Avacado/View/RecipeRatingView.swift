//
//  RecipeRatingView.swift
//  Avacado
//
//  Created by Anant Prajapati on 18/09/24.
//

import SwiftUI

struct RecipeRatingView: View {
    
    var recipe : Recipe
    
    var body: some View {
        HStack(alignment : .center,spacing: 5){
            ForEach(1...(recipe.rating),id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews : PreviewProvider {
    static var previews: some View{
        RecipeRatingView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
