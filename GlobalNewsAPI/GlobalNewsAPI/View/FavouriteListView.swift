//
//  FavouriteListView.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 19/12/24.


import SwiftUI
import Alamofire

struct FavouriteListView: View {
    
    @AppStorage("favoriteArticles") private var favoriteArticlesData: Data = Data()
    @State private var favoriteArticles: [Lists] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteArticles, id: \.source.id) { article in
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        
                        Text(article.description ?? "No Description available")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteArticle)
            }
            .navigationTitle("Favorites")
            .foregroundColor(.blue)
        }
        .onAppear {
            favoriteArticles = getFavoriteArticles()
        }
    }
    
    private func getFavoriteArticles() -> [Lists] {
        do {
            return try JSONDecoder().decode([Lists].self, from: favoriteArticlesData)
        } catch {
            return []
        }
    }
    
    private func saveFavoriteArticles() {
        do {
            let data = try JSONEncoder().encode(favoriteArticles)
            favoriteArticlesData = data
        } catch {
            print("Failed to encode favorite articles: \(error)")
        }
    }
    
    private func deleteArticle(at offsets: IndexSet) {
        favoriteArticles.remove(atOffsets: offsets)
        saveFavoriteArticles()
    }
}

#Preview {
    FavouriteListView()
}







