//
//  NewsListView.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

import SwiftUI
import Alamofire

struct NewsListView: View {
    
    @ObservedObject private var messageViewModel = NewsViewModal()
//    @StateObject private var favoritesManager = FavoritesManager.shared
       
    var body: some View {
        ZStack{
            NavigationStack {
                List {
                    ForEach(messageViewModel.articles, id: \.title) { item in
                        NavigationLink(destination: ArticleListView(article: item)) {
                            NewsList(article: item)
                                .listRowBackground(Color.black)
                                .cornerRadius(8)
                        }
                    }
                }
                .navigationTitle("News Articles")
                .toolbar {
                    NavigationLink(destination: FavouriteListView()) {
                        Text("Favorites")
                    }
                }
                .onAppear {
                    messageViewModel.callMessageAPI()
                    messageViewModel.getNewsListingAPI { status, message in
                        if status == 401 {
                            print("Error Loading Message")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}


