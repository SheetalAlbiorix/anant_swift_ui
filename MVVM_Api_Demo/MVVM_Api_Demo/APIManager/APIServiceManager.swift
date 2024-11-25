//
//  APIServiceManager.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import Foundation
import UIKit
import Alamofire


class APIServiceManager : NSObject {
    static let shared = APIServiceManager()
    
    
    func createURLRequest(ApiType apiType:String, Url apiUrl: String, ContentType contentType: String,isAuth auth: Bool = false, Parameter parameter: NSDictionary?) -> URLRequest? {
        let urlString = apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)!
        
        
        var urlRequest = URLRequest(url: url)
        
        if auth {
            let authToken = UserDefaults.standard.string(forKey: "authToken")
            urlRequest.setValue("Bearer " + (authToken == nil ? "":authToken!), forHTTPHeaderField: APIURL.headerKey)
        }
        
        
        urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = apiType
        urlRequest.timeoutInterval = contentType == APIContentType.MultiPart ? 180:60
        
        if contentType != APIContentType.MultiPart {
            if parameter != nil {
                do{
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameter!, options: [])
                } catch (let error){
                    print("Create URL Request Error: ", error)
                }
            }
        }
        return urlRequest
    }
    
    //MARK: - Json API Call Structure
    func requestApiWithJson<T:Decodable>(request urlRequest: URLRequest, decodeTo: T.Type, completionHandler:@escaping((Result<T, Error>) ->Void)) {
        AF.request(urlRequest).response { response in
            switch response.result
            {
                case .success:
                    do {
                        let responseJSON = try JSONDecoder().decode(decodeTo, from: response.data!)
                        completionHandler(.success(responseJSON))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    break;
                case .failure(let error):
                    completionHandler(.failure(error))
                    break
            }
        }
    }
    //MARK: - Multipart / Form Data API Call Structure
    func requestApiWithMultiPart<T:Decodable>(request urlRequest: URLRequest, multiPart multipart: NSDictionary?, parameter parameters: NSDictionary?, decodeTo: T.Type, completionHandler:@escaping((Result<T, Error>) ->Void)) {
        
        AF.upload(multipartFormData: { multipartFormData in
            if multipart != nil {
                for (key, value) in multipart!
                {
                    if key as! String == "image" {
                        multipartFormData.append(value as! Data, withName: key as! String , fileName: String(key as! String + ".jpeg"), mimeType: "image/jpeg")
                    }else if key as! String == "file" {
                        multipartFormData.append(value as! Data, withName: key as! String , fileName: String(key as! String + ".jpeg"), mimeType: "image/jpeg")
                    }else if key as! String == "files" {
                        multipartFormData.append(value as! Data, withName: key as! String , fileName: String(key as! String + ".jpeg"), mimeType: "image/jpeg")
                    }else {
                        multipartFormData.append(value as! Data, withName: "image" , fileName: String(key as! String + ".mp4"), mimeType: "video/mp4")
                    }
                }
            }
            
            if parameters != nil {
                for (key, value) in parameters!
                {
                    if value is NSDictionary || value is NSArray {
                        let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        multipartFormData.append(data!, withName: key as! String)
                    }else {
                        var newValue = ""
                        if value is String {
                            newValue = value as! String
                        }else if value is Int {
                            newValue = String(value as! Int)
                        }else if value is Double {
                            newValue = String(value as! Double)
                        }else if value is Float {
                            newValue = String(value as! Float)
                        }else if value is Bool {
                            newValue = String(value as! Bool)
                        }
                        multipartFormData.append(newValue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key as! String)
                    }
                }
            }
        }, with: urlRequest)
        .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .response { response in
            switch response.result
            {
                case .success:
                    do {
                        let responseJSON = try JSONDecoder().decode(decodeTo, from: response.data!)
                        completionHandler(.success(responseJSON))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    break;
                case .failure(let error):
                    completionHandler(.failure(error))
                    break
            }
        }
    }
    
}
