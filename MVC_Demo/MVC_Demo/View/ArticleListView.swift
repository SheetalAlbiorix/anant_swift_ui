//
//  ArticleListView.swift
//  MVC_Demo
//
//  Created by Anant Prajapati on 06/11/24.
//

import SwiftUI

struct ArticleListView: View {
    
    let article : Article
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding(.bottom, 10)
         
                if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                }
            
                VStack {
                    Text(article.description ?? "No description available.")
                        .font(.headline)
                        .padding(.top, 10)
                   
                    
                }
            }
            .padding()
        }
        .navigationTitle("Articles")
    }
}

//#Preview {
//    ArticleListView()
//}
