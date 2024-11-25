//
//  NewsModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import Foundation
import Combine
import Alamofire

//MARK: - News Response
struct NewsModal : Codable {
    let status : String
    let totalResults : Int
    let articles : [Article]
    
    
}
//MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
}
//MARK: - Source
struct Source : Codable {
    let id : String?
    let name : String
}
