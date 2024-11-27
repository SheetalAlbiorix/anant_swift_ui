//
//  NewsService.swift
//  MVC_Demo
//
//  Created by Anant Prajapati on 06/11/24.
//

//import Foundation
//import Alamofire
//import Combine
//
//class NewsServices {
//    func fetchNew(completion: @escaping (Result<[Article], Error>) -> Void) {
//        let url = "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"
//
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: NewsResponse.self) { response in
//                switch response.result {
//                case .success(let newsResponse):
//                    completion(.success(newsResponse.articles))
//                case .failure(let error):
//                        completion(.failure(error))
//                }
//            }
//    }
//}
