//
//  NewsViewModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import Foundation
import SwiftUI


class NewsViewModal : ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    
    func getNewsListingAPI (completionHandler: @escaping((Int, String) -> Void)) {
        NewsService.shared.getNewsListingAPI{ result in
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
}
