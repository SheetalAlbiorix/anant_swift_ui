//
//  PhoneInputView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 12/11/24.
//

import SwiftUI
import CountryPicker
import FirebaseCore
import FirebaseAuth
import GoogleSignIn



struct PhoneInputView: View {
    @Binding var iscountry : Country?
    
    @State private var showCountryPicker = false
    @State private var phoneNumber = ""
    @State private var showAlert = false
    @State private var signIn = false
    @State private var navigateToPass = false
    @State private var currentVerificationId: String?
    
    @StateObject private var view = GoogleSignIn()
    
    var body: some View {
        
        
        VStack {
            // MARK: - Label
            Spacer()
            HStack{
                Text("Enter your Mobile Number")
                    .font(.system(size: 25, weight: .medium, design: .default))
                Spacer()
            }
            .padding()
            
            // MARK: - CountryPickerView
            
            HStack {
                HStack(spacing:10){
                    
                    //MARK: -CountryFlag
                    if let country = iscountry{
                        Text(country.isoCode.getFlag())
                            .font(.largeTitle)
                        
                    }else{
                        
                        Text("IN".getFlag())
                            .font(.largeTitle)
                    }
                    
                    //MARK: CountryCode
                    Text(iscountry?.phoneCode ?? "91")
                    
                    //MARK: -CountryDropDownButton
                    Button{
                        print("ButtonPressed")
                        showCountryPicker = true
                    }label: {
                        Image("DropDown")
                            .frame(width: 30, height: 30)
                    }
                    .sheet(isPresented: $showCountryPicker) {
                        CountryPicker(selectedCountry: $iscountry)
                        
                    }
                    
                    Divider()
                        .frame(width:1,height: 30)
                        .overlay(Color.white)
                    
                    //MARK: -MobileNumber
                    
                    TextField("Mobile number", text: $phoneNumber)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding()
                .frame(height: 60)
                .background(Color(.systemGray6))
                
                
            }
            .padding(.horizontal)
            
            // MARK: - Next Button
            HStack {
                Button {
                    //                        sendVerificationCode()
                    
                    if phoneNumber.isEmpty || !isValidPhoneNumber(phoneNumber) {
                        //                            showAlert = true
                    } else {
                        sendVerificationCode()
                    }
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(height: 60)
                    .background(Color.black)
                    .cornerRadius(8)
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), message: Text("Please enter 10-digit mobile Number"), dismissButton: .default(Text("OK")))
            }
            NavigationLink(destination: PhoneVerificationView(verificationID: currentVerificationId ?? ""), isActive: $navigateToPass) {
                EmptyView()
            }
            //                NavigationLink(destination: PasswordInputView(), isActive: $signIn) {
            //                    EmptyView()
            //                }
            //
            // MARK: - Consent Label
            HStack(spacing: 10) {
                Text("By proceeding, you consent to get call, Whatsapp or SMS messages, including by automated means, from Uber and its affiliates to the number provided.")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            .padding(.bottom)
            .padding(.horizontal)
            
            // MARK: - Divider
            HStack {
                Divider()
                    .frame(width: 160, height: 1)
                    .background(Color.gray.opacity(0.5))
                Text("or")
                    .foregroundColor(.gray)
                Divider()
                    .frame(width: 160, height: 1)
                    .background(Color.gray.opacity(0.5))
            }
            .padding()
            
            // MARK: - Google Sign-In Button
            HStack {
                Button {
                    view.signInWithGoogle { success in
                        if success {
                            signIn = true
                        }
                    }
                } label: {
                    HStack {
                        Image("GoogleSignIn")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60) // Adjust height as needed
                    }
                }
            }
            .padding()
            NavigationLink(destination: WelcomeView(), isActive: $signIn) {
                EmptyView()
            }
            Spacer()
            Spacer()
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
    
    private func isValidPhoneNumber(_ number: String) -> Bool {
        
        let digits = number.filter { $0.isNumber }
        return digits.count == 10
    }
    
          func sendVerificationCode() {
    
            Auth.auth().languageCode = "en"
    //        Auth.auth().settings?.isAppVerificationDisabledForTesting = false
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("Error sending verification code: \(error.localizedDescription)")
                    return
                }else{
                    self.currentVerificationId = verificationID!
                    self.phoneNumber = phoneNumber
    
                }
            }
        }
}

    
    struct PhoneInputView_Previews: PreviewProvider {
        
        static var previews: some View {
            struct PreviewWrapper: View {
                @State private var country: Country?
                var body: some View {
                    PhoneInputView(iscountry: $country)
                }
            }
            return PreviewWrapper()
        }
    }

