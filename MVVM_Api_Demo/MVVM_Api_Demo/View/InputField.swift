//
//  InputField.swift
//  Ventura
//
//  Created by Apple on 14/10/24.
//

import SwiftUI

struct InputField: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: iconName)
                  
                    .frame(width: 50, height: 50)
            }
            if text.isEmpty {
                Text(placeholder)
                    
                    .padding(.leading, 8)
            }
            
            if isSecure {
                SecureField("", text: $text)
                    .foregroundColor(.black)
            } else {
                TextField("", text: $text)
                    
            }
        }
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
        .padding(.horizontal, 10.0)
    }
}
