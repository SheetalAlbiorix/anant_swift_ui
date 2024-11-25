//
//  LoginService.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import SwiftUI
import Foundation

class LoginService {
    static let shared = LoginService()
    
    func postUserAuthAPI(parameter: [String: Any], completionHandler: @escaping (Result<LoginModal, Error>) -> Void) {
        let request = APIServiceManager.shared.createURLRequest(ApiType: APIRequestType.POST, Url: LoginModule.login, ContentType: APIContentType.Json, Parameter: parameter as NSDictionary)
        
        guard let request = request else {
            completionHandler(.failure(NSError(domain: "Invalid Request", code: 400, userInfo: nil)))
            return
        }
        
        APIServiceManager.shared.requestApiWithJson(request: request, decodeTo: LoginModal.self) { result in
            switch result {
            case .success(let loginResponse):
                // Store the token in UserDefaults
                UserDefaults.standard.set(loginResponse.token, forKey: "authToken")
                completionHandler(.success(loginResponse))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
