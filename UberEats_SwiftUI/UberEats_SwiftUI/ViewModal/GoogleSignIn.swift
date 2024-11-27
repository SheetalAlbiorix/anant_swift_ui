//
//  GoogleSignIn.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 14/11/24.
//


import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class GoogleSignIn: ObservableObject {
    
    @Published var isLogin: Bool = false
    
    func signInWithGoogle(completion: @escaping (Bool) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
       
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) { [unowned self] result, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                  completion(false)
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                // Successful sign-in
                self.isLogin = true
                completion(true)
            }
        }
    }
}
