//
//  UserUrlSession.swift
//  Api_Demo
//
//  Created by Anant Prajapati on 22/11/24.
//

import Foundation


class UserUrlSession {
    
    static let shared = UserUrlSession()
    
    func userPostRequest( completionHandler : @escaping (User) -> Void) {
        
        //MARK: -Url Component
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "reqres.in"
        components.path = "/api/user"
        
        //MARK: -CreateURl
        
        guard let url = components.url else {
            print("invalid url")
            return
        }
        
        //MARK: -URL request
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //MARK: POST Request
        
        let firstUser = User(name: "Anant", job: "Senior iOS Developer")
        
        guard let httpBody = try? JSONEncoder().encode(firstUser) else {
            print("Invalid http")
            return
        }
        
        
        
        //MARK: -Set HttpBody
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) {
            data,response,error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.customFormatter)
                    let user  = try decoder.decode(User.self, from: data)
                    completionHandler(user)
                    
                } catch (let error) {
                    print(error.localizedDescription)
                }
            }else {
                print("no data")
            }
        }.resume()
    }
    
    //MARK: - PUT Api
    
    func putMethod(completion: @escaping (User) -> Void)  {
        guard let url = URL(string: "https://reqres.in/api/users/2") else {
            print("Error: cannot create URL")
            return
        }
        
        // Create model
        struct UploadData: Codable {
            let name: String
            let job: String
        }
        
        // Add data to the model
        let uploadDataModel = UploadData(name: "Nicole", job: "iOS Developer")
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling PUT")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
}

    
        //MARK: - Date Formatter

extension DateFormatter {
    
    static let  customFormatter : DateFormatter = {
        let formattor = DateFormatter()
        formattor.dateFormat = "dd.MM.yy"
        formattor.calendar = Calendar(identifier: .iso8601)
        formattor.timeZone = TimeZone(secondsFromGMT: 0)
        formattor.locale = Locale.current
        return formattor
        
    }()
}








//        var secondUser = User(name: "Prajapati", job : "leader")
//        guard let httpBody2 = try? JSONSerialization.data(withJSONObject: secondUser, options: []) else {
//            return
//        }
