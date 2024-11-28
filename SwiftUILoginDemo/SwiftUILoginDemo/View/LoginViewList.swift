//
//  LoginViewList.swift
//  SwiftUILoginDemo
//
//  Created by Anant Prajapati on 16/10/24.
//

import SwiftUI

struct LoginViewList: View {
    
    @State private var email: String = ""
    @State private var passWord: String = ""
    @State private var signUpView = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing :16){
                    Spacer()
                    
                    // Logo
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 200)
                    
                    
                    // text
                    Text("Lets Connect with Us!!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    
                    // TextField View As InputView
                    VStack{
                        InputView(value: $email, placeholder: "Email")
                        InputView(value: $passWord, placeholder: "password")
                        
                    }
                    .onChange(of: email) {
                        print("email: ", email)
                    }
                    .onChange(of: passWord){
                        print("password: ", passWord)
                    }
                    
                    // Forget Label
                    HStack{
                        Spacer()
                        Text("Forget Password!")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                    }       
                    .padding()
                    
                    
                    // Button
                    
                    Button{
                        signUpView = true
                    }label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    NavigationLink("", destination:  SignUpView(), isActive: $signUpView)
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical)
        }
    }
}
#Preview {
        LoginViewList()
    }

