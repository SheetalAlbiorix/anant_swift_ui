//
//  NewsController.swift
//  MVC_Demo
//
//  Created by Anant Prajapati on 06/11/24.
//

import Foundation
import Alamofire
import Combine

//class NewsControllers : ObservableObject {
//    
//    @Published  var articles : [Article] = []
//    @Published  var isLoading : Bool = false
//    @Published  var errorMessage : String?
//    
//    private var newsService = NewsServices()
//    
//    func fetchNews() {
//        isLoading = true
//        
//        newsService.fetchNew { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                    case .success(let articles):
//                        self.articles = articles
//                    case .failure(let error):
//                        self.errorMessage = "Error fetching data: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//}
//    

       

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchNews() {
        isLoading = true
        let url = "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"
        
        AF.request(url)
            .validate() // Validate the response
            .responseDecodable(of: NewsResponse.self) { response in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                switch response.result {
                    case .success(let newsResponse):
                        DispatchQueue.main.async {
                            self.articles = newsResponse.articles
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                        }
                }
            }
         }
     }
