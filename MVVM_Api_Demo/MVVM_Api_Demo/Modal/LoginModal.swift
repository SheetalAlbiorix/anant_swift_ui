//
//  LoginModal.swift
//  MVVM_Api_Demo
//
//  Created by Anant Prajapati on 25/11/24.
//






struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    let token: String
}

struct ErrorResponse: Decodable {
    let error: String
}

