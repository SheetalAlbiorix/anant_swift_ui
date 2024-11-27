//
//  NewsListView.swift
//  MVC_Demo
//
//  Created by Anant Prajapati on 06/11/24.
//

import SwiftUI
import Alamofire

struct NewsListView: View {
    
    @StateObject var viewModal = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if viewModal.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModal.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModal.articles, id: \.title) { item in
                        NavigationLink(destination: ArticleListView(article: item)) {
                            HStack(spacing: 15){
                                if let urlToImage = item.urlToImage, let url = URL(string: urlToImage) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                             .scaledToFill()
                                             .frame(width:100,height:90)
                                             .shadow(radius: 5)
                                             .cornerRadius(8)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        
                                    Text(item.publishedAt)
                                        .font(.subheadline)
                                    Text("Author:\(item.author ?? "No author found")")
                                        .font(.headline)
                                    
                                }
                               
                            }
                            
                        }
                    }
                    
                    .navigationTitle("Health News")
                
                }
                    
            }
            
            .onAppear {
                viewModal.fetchNews()
            }
        }
    }
}

#Preview {
    NewsListView()
}
