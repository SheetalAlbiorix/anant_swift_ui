//
//  APIRequestUrl.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import Foundation

struct APIURL {
    static let headerKey = "Authorization"
    static let  baseUrl = "https://saurav.tech/NewsAPI/"
    static let  baseURL2 = "https://reqres.in/api/"
}

struct NewsModule {
    static let topHeadlines = APIURL.baseUrl + "top-headlines/category/health/in.json"
}

struct LoginModule {
    static let login = APIURL.baseURL2 + "login"
}






//MARK: -PUBLIC DUMMY URL

// "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"


//"https://reqres.in/api/login"

