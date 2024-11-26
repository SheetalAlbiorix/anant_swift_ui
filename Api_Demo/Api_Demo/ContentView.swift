//
//  ContentView.swift
//  Api_Demo
//
//  Created by Anant Prajapati on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var user = User(name: "****", job: "****", id: nil ,dateCreated: nil)
    
    
    var body: some View {
        NavigationView {
            VStack {
                List()  {
                    Section(header: Text("Our data")) {
                        Text("Name:-\(user.name)")
                        Text("Job:-\(user.job)")
                        Text("ID:-\(user.id ?? "")")
                        Text("Created:-\(user.dateCreated)")
                    }
                    
                    Section(header: Text("Updated data")) {
                        Text("Name:-\(user.name)")
                        Text("Job:-\(user.job)")
                        
                    }
                    
                    
                }
                .listStyle(GroupedListStyle())
                Button {
                    print("Post Api")
                    DispatchQueue.main.async {
                        UserUrlSession.shared.userPostRequest() { newUser in
                            user = newUser
                        }
                    }
                    
                }label: {
                    Text("Post Api")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
                    
                }
               
    
                Button {
                    UserUrlSession.shared.putMethod { updatedUser  in
                        DispatchQueue.main.async {
                            user = updatedUser
                        }
                    }
                } label: {
                    Text("PUT Api")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
                }
            }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Post Api")
            }
           
        }
    }


#Preview {
    ContentView()
}
