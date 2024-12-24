//
//  APIRequestUrl.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

import Foundation

struct APIURL {
    static let headerKey = "Authorization"
    static let  baseUrl = "https://saurav.tech/NewsAPI/"
    
}

struct NewsModule {
    static let topHeadlines = APIURL.baseUrl + "everything/cnn.json"
}


//https://saurav.tech/NewsAPI/everything/cnn.json
//https://saurav.tech/NewsAPI/sources.json
