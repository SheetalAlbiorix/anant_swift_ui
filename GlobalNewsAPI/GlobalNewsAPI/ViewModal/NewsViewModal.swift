//
//  NewsViewModal.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

import Foundation

class NewsViewModal : ObservableObject {
    
    @Published var articles : [Lists] = []
    @Published var isloading : Bool = false
    @Published var errorMessage : String?
    
    
    func getNewsListingAPI (completionHandler : @escaping((Int,String) -> Void)) {
        NewsService.shared.getListNewsAPI { result in
            switch result {
                case .success(let success):
                    self.articles = success.articles
                    completionHandler(success.totalResults, success.status)
                    break
                case .failure(let failure):
                    print("failure : ", failure.localizedDescription)
                    break
            }
        }
    }
    
    
    func callMessageAPI() {
        getNewsListingAPI { status, message  in
            if status == 401 {
                print("Error Message Loading")
            }
        }
    }
}
