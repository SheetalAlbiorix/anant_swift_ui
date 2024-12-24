//
//  APIConfig.swift
//  GlobalNewsAPI
//
//  Created by Anant Prajapati on 16/12/24.
//

import Foundation

struct APIRequestType {
    
    static let POST = "POST"
    static let GET = "GET"
    static let PUT = "PUT"
    static let PATCH = "PATCH"
    static let DELETE = "DELETE"
    
}

struct APIContentType {
    
    static let Json = "application/json"
    static let MultiPart = "multipart/form-data"
}
