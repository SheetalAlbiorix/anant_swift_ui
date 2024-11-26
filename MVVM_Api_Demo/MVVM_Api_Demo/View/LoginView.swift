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

    @State private var scale: CGFloat = 1.0
    @State private var isAnimating: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Image("newsPic")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(scale) // Apply scale effect
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                scale = 1.1
                            }
                        }
                    
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
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(8)
                        }
                        .background(Color.black)
                        .cornerRadius(5)
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
        if loginViewModel.username.isEmpty {
            alertMessage = "Please enter your email."
            showAlert = true
            return
        }
        
        if loginViewModel.password.isEmpty {
            alertMessage = "Please enter your password."
            showAlert = true
            return
        }

        loginViewModel.validation { title, message, status in
            if status {
                // Set navigateToNewsView to true to trigger the NavigationLink
                navigateToNewsView = true
            } else {
                // Handle login failure (e.g., show an alert)
                alertMessage = message!
                showAlert = true
            }
        }
    }
}

#Preview {
    LoginView()
}
