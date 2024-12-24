//
//  NewsList.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

//MARK: -Simple WhiteListView

//import SwiftUI
//import Alamofire
//
//struct NewsList: View {
//    
//    var article : Lists
//    
//    var body: some View {
//        ZStack {
//            VStack(alignment: .leading, spacing: 8) {
//                HStack(alignment: .top) {
//                    
//                    if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
//                        AsyncImage(url: url) { image in
//                            image.resizable()
//                                .scaledToFill()
//                                .frame(width: 80, height: 80)
//                                .clipped()
//                                .cornerRadius(8)
//                                .shadow(radius: 5)
//                        } placeholder: {
//                            ProgressView()
//                                .frame(width: 80, height: 80)
//                        }
//                    }
//                    
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(article.title)
//                            .font(.caption)
//                            .foregroundColor(.primary)
//                            .lineLimit(3)
//                        
//                        Text("Author: \(article.author ?? "Unknown Authour" )")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                            .fontWeight(.medium)
//                    }
//                    Spacer()
//                }
//              
//                .background(Color.white)
//            }
//        }
//    }
//}

//#Preview {
//    NewsList()
//}

//MARK: -Gradiant List View

import SwiftUI
import Alamofire

struct NewsList: View {
    var article: Lists
    
    var body: some View {
        
        ZStack {
            
            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.4)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    // Article Image
                    if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: Color.gray.opacity(0.8), radius: 7)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 80, height: 80)
                        }
                    }
                    
                    // Article Details
                    VStack(alignment: .leading, spacing: 4) {
                        Text(article.title)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                        
                        Text("Author: \(article.author ?? "Unknown Author")")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                            .fontWeight(.medium)
                    }
                    Spacer()
                }
            }
        }
    }
}
