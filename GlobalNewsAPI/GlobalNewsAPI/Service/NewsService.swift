//
//  NewsService.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

import Foundation

class NewsService {
    
    static let shared = NewsService()
    
    
    func getListNewsAPI(completionHandler: @escaping((Result<NewsModel, Error>)->Void)) {
        let request = APIServiceManager.shared.createURLRequest(ApiType: APIRequestType.GET, Url: NewsModule.topHeadlines, ContentType: APIContentType.Json, Parameter: nil)
        
        APIServiceManager.shared.requestApiWithJson(request: request!, decodeTo: NewsModel.self) { result in
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
