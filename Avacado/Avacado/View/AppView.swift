//
//  AppView.swift
//  Avacado
//
//  Created by Anant Prajapati on 13/09/24.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            AvacadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avacados")
                })
            
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Setting")
                })
            
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider{
    static var previews: some View{
        AppView()
    }
}
