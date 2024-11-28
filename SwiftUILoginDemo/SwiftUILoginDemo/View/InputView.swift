//
//  InputView.swift
//  SwiftUILoginDemo
//
//  Created by Anant Prajapati on 16/10/24.
//

import SwiftUI

struct InputView: View {
    
    @Binding var value: String
    @State var placeholder: String = ""
    @State var isSecure: Bool = false
    
    var body: some View {
     
            TextField(placeholder, text: $value)
                .frame(width: 320, height: 50)
                
                .tint(.red)
                .padding([.leading, .trailing], 20)
            
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.yellow, lineWidth: 1)
                )
        
                
        
    }
}

#Preview {
    InputView(value: .constant(""))
}
