//
//  SettingsView.swift
//  Avacado
//
//  Created by Anant Prajapati on 13/09/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotification : Bool = true
    @State private var backgrounfRefresh : Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment:.center , spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100,alignment: .center)
                    .shadow(color:Color("ColorBlackTransparentLight"),radius:8, x:0, y: 4)
                
                
                Text("Avocado".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form {
                Section(header: Text("General Setting")){
                    Toggle(isOn: $enableNotification){
                        Text("Enable Notification")
                    }
                    
                    Toggle(isOn: $backgrounfRefresh){
                        Text("Background Refresh")
                    }
                }
                Section(header: Text("Applications")){
                    if enableNotification {
                        HStack {
                            Text("Product").foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatibility").foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack {
                            Text("Developer").foregroundColor(.gray)
                            Spacer()
                            Text("Anant Prajapati")
                        }
                        HStack {
                            Text("Website").foregroundColor(.gray)
                            Spacer()
                            Text("swiftUImasterclass.com")
                        }
                        HStack {
                            Text("version").foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack{
                            Text("Personal Message").foregroundColor(.gray)
                            Spacer()
                            Text("Happy Coding!!!")
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 640)
    }
}

struct SettingsView_Previews : PreviewProvider {
    static var previews: some View{
        SettingsView()
    }
}
