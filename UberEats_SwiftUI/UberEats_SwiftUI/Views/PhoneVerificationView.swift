//
//  PhoneVerificationView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 14/11/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct PhoneVerificationView: View {
    
    var verificationID: String?
    var phoneNumber = ""
    @State private var otp = ["", "", "", "", "", ""]
    @State private var codeDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    
    var body: some View {
        VStack{
            //MARK: Label
            Spacer()
            HStack{
                Text("Enter the 6-Digit Code Sent to you at 9428976681")
                    .font(.system(size: 25,weight: .medium,design: .default))
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: PasswordField
            
            HStack(spacing:10){
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $codeDigits[index])
                        .frame(width: 50, height: 60)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(RoundedRectangle(cornerRadius: 2).fill(Color(.systemGray5)))
                        .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color(.systemGray4), lineWidth: 1))
                        .focused($focusedField, equals: index) // Manage focus
                        .onChange(of: codeDigits[index]) { newValue in
                            if newValue.count == 1 {
                                
                                if index < 5 {
                                    focusedField = index + 1
                                }
                            } else if newValue.isEmpty {
                                
                                if index > 0 {
                                    focusedField = index - 1
                                }
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                            if codeDigits[index].count > 1 {
                                codeDigits[index] = String(codeDigits[index].prefix(1))
                            }
                        }
                }
            }
            .padding()
            
            //MARK: Button
            HStack{
                Button {
                    print("Continue")
                    
                } label: {
                    HStack{
                        Text("I've forgotten my password")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        
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
                    print("Continue")
                    
                } label: {
                    HStack{
                        Text("login with password")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        
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
                    let smsCode = codeDigits.joined()
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: smsCode)
                    
                    Auth.auth().signIn(with: credential) { (authResult, error) in
                        if let error = error {
                            let authError = error as NSError
                            print(authError.localizedDescription)
                            
                            return
                        }
                        let currentUserInstance = Auth.auth().currentUser
                        print("User  signed in successfully!")
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
                        .foregroundColor(.gray)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(100)
                    }
                }
                .padding()
            }
        }
    }


#Preview {
    PhoneVerificationView()
}
