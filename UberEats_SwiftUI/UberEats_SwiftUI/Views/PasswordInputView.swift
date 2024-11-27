//
//  PasswordInputView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 14/11/24.
//

import SwiftUI

struct PasswordInputView: View {
    
    @State private var password = ""
    @State private var showPassword = false
    @State private var navigateToNext = false
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            //MARK: Label
            Spacer()
            HStack{
                Text("Welcome back, John")
                    .font(.system(size: 25,weight: .medium,design: .default))
                Spacer()
            }
            .padding(.horizontal)
            //MARK: PasswordField
            HStack {
        
                if showPassword {
                    TextField("Please enter your password",
                              text: $password)
                } else {
                    SecureField("Please enter your password",
                                text: $password)
                }
                Button(action: { self.showPassword.toggle()}) {
                    
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                }
            }
            .frame(height: 30)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .padding()
            
            //MARK: Button
            HStack{
                Button {
                    print("I've forgotten my password")
                    
                } label: {
                    HStack{
                        Text("I've forgotten my password")
                            .font(.title3)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(100)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: Button
            HStack{
                Button {
                    print("I can't sign in")
                    
                } label: {
                    HStack{
                        Text("I can't sign in")
                            .font(.title3)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(100)
                }
                Spacer()
            }
            .padding()
            Spacer()
            Spacer()
            Spacer()
            
            //MARK: FootView Button
            
            HStack{
                Button {
                    print("Continue")
                    
                } label: {
                    HStack{
                        Image(systemName: "arrow.left")
                            .frame(width: 30,height: 30)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(100)
                }
                Spacer()
                
                Button {
                    
                    if password == "123456" {
                        navigateToNext = true
                    }else {
                        showAlert = true
                    }
                    
                } label: {
                    HStack{
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                           
                    }
                    .frame(width: 100)
                    .padding()
                    .foregroundColor(password == "123456" ? Color.black : .gray)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(100)
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), message: Text("Incorrect password. Please try again."), dismissButton: .default(Text("OK")))
            }
            
            NavigationLink(destination: WelcomeView(), isActive: $navigateToNext) {
                EmptyView() // Using EmptyView for a hidden link
            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    PasswordInputView()
}
