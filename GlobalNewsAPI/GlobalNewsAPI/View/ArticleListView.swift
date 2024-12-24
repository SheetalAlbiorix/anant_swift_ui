//
//  ArticleListView.swift
//  MVC_Demo
//
//  Created by Anant Prajapati on 06/11/24.


import Foundation
import SwiftUI



struct ArticleListView: View {
    let article: Lists
    @State private var isFavorite = false
    @AppStorage("favoriteArticles") private var favoriteArticlesData: Data = Data()
//    @State private var  showHeartAnimation: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.8), radius: 7)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                        
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.system(.callout, design: .serif))
                                .foregroundColor(.red)
                                .fontWeight(.thin)
                                .padding(.bottom, 5)
                            
                            Text("Detail Description:")
                                .font(.system(.caption, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .underline()
                                .padding(.bottom, 5)
                            
                            Text(article.description ?? "No Description available")
                                .font(.system(.subheadline, design: .serif))
                                .padding(.bottom, 5)
                        }
                        .padding()
                    }
                }
                .padding()
            }
            .navigationTitle("Article Details")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)){
                            isFavorite.toggle()
                            handleFavoriteChange()
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                            .scaleEffect(isFavorite ? 1.5 : 1.0)
                    }
                }
            }
        }
        .onAppear {
            // Initialize isFavorite when the view appears
            isFavorite = isArticleFavorite(article)
            let data = getFavoriteArticles()
            print("article id1:", data.count)

            let index = data.firstIndex { item in
                print("article id:", article.source.id!, item.source.id!)
                return item.source.id == article.source.id
            }
           print("get fav data \(index)")
        }
    }
    // MARK: - Functions
    
    func handleFavoriteChange() {
        var favoriteArticles = getFavoriteArticles()
        if isFavorite {
            favoriteArticles.append(article)
        } else {
            favoriteArticles.removeAll { $0.source.id == article.source.id }
        }
        saveFavoriteArticles(favoriteArticles)
    }
    
    func saveFavoriteArticles(_ articles: [Lists]) {
        do {
            let data = try JSONEncoder().encode(articles)
            favoriteArticlesData = data
        } catch {
            print("Failed to encode favorite articles: \(error)")
        }
    }
    
    func getFavoriteArticles() -> [Lists] {
        do {
            return try JSONDecoder().decode([Lists].self, from: favoriteArticlesData)
        } catch {
            return []
        }
    }
    
    func isArticleFavorite(_ article: Lists) -> Bool {
        let favoriteArticles = getFavoriteArticles()
        return favoriteArticles.contains { $0.source.id == article.source.id }
    }
}




