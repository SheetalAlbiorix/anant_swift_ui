//
//  LoginViewModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = "emilys" // Changed from email to username
    @Published var password: String = "emilyspass"
    
    func validation(completionHandler: @escaping (String?, String?, Bool) -> Void) {
        // Validate inputs
        if username.isEmpty {
            completionHandler(AppTextName.emailValidation, AppTextName.emailValidationMsg, false)
        } else if password.isEmpty {
            completionHandler(AppTextName.passValidation, AppTextName.passValidationMsg, false)
        } else {
            // Call login function
            callLogin { status, message in
                if status {
                    completionHandler(AppTextName.loginSuccess, message, status)
                } else {
                    completionHandler(AppTextName.loginFail, message, status)
                }
            }
        }
    }
    
    func callLogin(completionHandler: @escaping (Bool, String) -> Void) {
        // Prepare parameters for the login request
        let parameter = ["username": username, "password": password] as NSDictionary
        
        // Call the login service
        LoginService.shared.postUserAuthAPI(parameter: parameter as! [String : Any]) { result in
            switch result {
            case .success(let success):
                // Successful login
                completionHandler(true, AppTextName.loginSuccessMsg)
                print("Login successful: \(success.user.username)") // Adjusted to access the user object
            case .failure(let failure):
                // Handle login failure
                completionHandler(false, failure.localizedDescription)
            }
        }
    }
}
