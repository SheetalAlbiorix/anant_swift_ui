//
//  LoginViewModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = "eve.holt@reqres.in"  /* eve.holt@reqres.in*/
    @Published var password: String = "cityslicka" /*cityslicka*/
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var successMessage: String? = nil
    
    // Validation for username and password
    func validation(completionHandler: @escaping (String?, String?, Bool) -> Void) {
        // Validate inputs
        if username.isEmpty {
            completionHandler("Username is required", "Please enter your username.", false)
        } else if password.isEmpty {
            completionHandler("Password is required", "Please enter your password.", false)
        } else {
            // Proceed to login if validation passes
            callLogin { status, message in
                if status {
                    completionHandler("Login Successful", message, status)
                } else {
                    completionHandler("Login Failed", message, status)
                }
            }
        }
    }
    
    // API call to login
    func callLogin(completionHandler: @escaping (Bool, String) -> Void) {
        isLoading = true
        let parameter = LoginRequest(email: username, password: password)
        
        LoginService.shared.postUserAuthAPI(parameter: parameter) { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            switch result {
            case .success(let response):
                // Store the token and handle success
                UserDefaults.standard.set(response.token, forKey: "authToken")
                completionHandler(true, "Login successful! Welcome, \(response.token).")
                print("Login successful: \(response.token)")  // Successful login
            case .failure(let error):
                // Handle failure
                completionHandler(false, error.localizedDescription)
                print("Login failed: \(error.localizedDescription)")  // Handle error
            }
        }
    }
}
