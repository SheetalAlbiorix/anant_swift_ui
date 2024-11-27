//
//  SettingView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 19/11/24.
//

import SwiftUI

struct SettingView: View {
    
  

    var body: some View {
        HStack{
            Spacer()
            Text("Now.London Hall")
                .font(.title3)
                .fontWeight(.semibold)
            
            Image("DropDown")
            Spacer()
            
            Button {
                print("Open Sheet")
              
            } label: {
               
                    Image("Adjust")
                        .frame(width: 30,height: 30)
                
            }
            .padding(.horizontal,20)
        }
    }
}
#Preview {
    SettingView()
}
