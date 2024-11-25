//
//  LoginView.swift
//  Ventura
//
//  Created by Apple on 18/09/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var loginViewModel = LoginViewModel()
    @State private var navigateToNewsView: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(Theme.ventuoraLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer().frame(height: 20)
                    
                    VStack(alignment: .leading) {
                        Text(AppTextName.login)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(AppTextName.singInAccount)
                            .fontWeight(.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20.0)
                    
                    Spacer().frame(height: 20)
                    
                    VStack(spacing: 20) {
                        InputField(iconName: Theme.envelop, placeholder: AppTextName.email, text: $loginViewModel.username)
                        InputField(iconName: Theme.lock, placeholder: AppTextName.pass, text: $loginViewModel.password, isSecure: true)
                    }
                    Spacer().frame(height: 20)
                    
                    HStack {
                        Button(action: {
                            handleLogin()
                        }) {
                            Text(AppTextName.login)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal, 10)
                        .frame(width: 100.0)
                        Spacer()
                    }
                    
                    // NavigationLink to NewsListView
                    NavigationLink(destination: NewsListView(), isActive: $navigateToNewsView) {
                        EmptyView() // Using EmptyView for a hidden link
                    }
                    Spacer()
                }
                .padding(.horizontal, 20.0)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // MARK: - Login Handle Function
    func handleLogin() {
        loginViewModel.validation { title, message, status in
            if status {
                // Set navigateToNewsView to true to trigger the NavigationLink
                navigateToNewsView = true
            } else {
                // Handle login failure (e.g., show an alert)
                // You can use an alert or other UI elements to notify the user
                print("Login failed: \(message)")
            }
        }
    }
}

#Preview {
    LoginView()
}
