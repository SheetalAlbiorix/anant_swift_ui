//
//  NewsService.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import Foundation
import SwiftUI


class NewsService {
    static let shared = NewsService()
    
    //MARK: - Get Message List
    func getNewsListingAPI(completionHandler: @escaping((Result<NewsModal, Error>) -> Void)) {
        let request = APIServiceManager.shared.createURLRequest(ApiType: APIRequestType.GET, Url: NewsModule.topHeadlines, ContentType: APIContentType.Json, Parameter: nil)

        APIServiceManager.shared.requestApiWithJson(request: request!, decodeTo: NewsModal.self) { result in
            switch result {
            case .success(let success):
                completionHandler(.success(success))
                break
            case .failure(let failure):
                completionHandler(.failure(failure))
                break
            }
        }
    }
}
