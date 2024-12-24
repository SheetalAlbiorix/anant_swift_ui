//
//  Favorites.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 23/12/24.
//
import Foundation
import SwiftUI

//class FavoritesManager: ObservableObject {
//    @Published var favoriteArticles: [Lists] = []
//    @AppStorage("favoriteArticles") private var favoriteArticlesData: Data = Data()
//
//    init() {
//        loadFavorites()
//    }
//
//    func toggleFavorite(for article: Lists) {
//        if isFavorite(article) {
//            favoriteArticles.removeAll { $0.title == article.title }
//        } else {
//            favoriteArticles.append(article)
//        }
//        saveFavorites()
//    }
//
//    func isFavorite(_ article: Lists) -> Bool {
//        favoriteArticles.contains { $0.title == article.title }
//    }
//
//    private func loadFavorites() {
//        do {
//            favoriteArticles = try JSONDecoder().decode([Lists].self, from: favoriteArticlesData)
//        } catch {
//            favoriteArticles = []
//        }
//    }
//
//    private func saveFavorites() {
//        do {
//            let data = try JSONEncoder().encode(favoriteArticles)
//            favoriteArticlesData = data
//        } catch {
//            print("Failed to save favorites: \(error)")
//        }
//    }
//}


//import Foundation
//import SwiftUI
//
//class FavoritesManager: ObservableObject {
//    static let shared = FavoritesManager()
//    
//    @Published var favoriteArticles: [Lists] = [] {
//        didSet {
//            saveFavorites()
//        }
//    }
//    
//    init() {
//        loadFavorites()
//    }
//    
//    private func saveFavorites() {
//        if let encoded = try? JSONEncoder().encode(favoriteArticles) {
//            UserDefaults.standard.set(encoded, forKey: "favoriteArticles")
//        }
//    }
//    
//    private func loadFavorites() {
//        if let data = UserDefaults.standard.data(forKey: "favoriteArticles"),
//           let decoded = try? JSONDecoder().decode([Lists].self, from: data) {
//            favoriteArticles = decoded
//        }
//    }
//    
//    func toggleFavorite(article: Lists) {
//        if isFavorite(article) {
//            favoriteArticles.removeAll { $0.id == article.id }
//        } else {
//            favoriteArticles.append(article)
//        }
//    }
//    
//    func isFavorite(_ article: Lists) -> Bool {
//        favoriteArticles.contains { $0.id == article.id }
//    }
//}
