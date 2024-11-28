//
//  ContentView.swift
//  SwiftUILoginDemo
//
//  Created by Anant Prajapati on 16/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            LoginView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
