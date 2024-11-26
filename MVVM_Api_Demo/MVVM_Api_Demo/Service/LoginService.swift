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
    
    func postUserAuthAPI(parameter: LoginRequest, completionHandler: @escaping (Result<LoginResponse, Error>) -> Void) {
        
        guard let parameterDict = convertToDictionary(parameter) else {
                    completionHandler(.failure(NSError(domain: "Invalid Request", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed to convert LoginRequest to dictionary."])))
                    return
                }
                
        let request = APIServiceManager.shared.createURLRequest(ApiType: APIRequestType.POST, Url: LoginModule.login, ContentType: APIContentType.Json, Parameter: parameterDict as NSDictionary )
        
        guard let request = request else {
            completionHandler(.failure(NSError(domain: "Invalid Request", code: 400, userInfo: nil)))
            return
        }
        
        APIServiceManager.shared.requestApiWithJson(request: request, decodeTo: LoginResponse.self) { result in
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
    
    
    private func convertToDictionary(_ loginRequest: LoginRequest) -> [String: Any]? {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(loginRequest)
                let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                return dictionary
            } catch {
                print("Error encoding LoginRequest: \(error)")
                return nil
            }
        }
}
