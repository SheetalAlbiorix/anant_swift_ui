//
//  LoginModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//






import Foundation

struct LoginModal: Decodable {
    let user: User
    let token: String

    struct User: Decodable {
        let id: Int
        let firstName: String
        let lastName: String
        let email: String
        let username: String
        // Add other fields as necessary
    }
}
