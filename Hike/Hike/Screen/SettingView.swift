//
//  SettingView.swift
//  Hike
//
//  Created by Anant Prajapati on 02/08/24.
//

import SwiftUI

struct SettingView: View {
    // PROPERTIES
    
    private var alternateAppIcon : [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    ]
    
    
    var body: some View {
        List{
            //MARK: - HEADER
            Section{
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    
                    VStack(spacing : -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    
                    Spacer()
                    
                }
                .foregroundStyle(
                    LinearGradient(colors: [.CustomGreenLight,.CustomGreenMedium,.CustomGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top , 8)
                
                VStack(spacing : 8){
                    Text("Find a perfect Hike? ")
                        .font(.title2)
                        .fontWeight(.heavy)
                  
                    Text("The Which look gorgeous In photo But even More Beautiful when u see.The that Hope u do again someday. Find Best Place To Hike")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the Boots! . It's time For Walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.CustomGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom , 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION ICON
            
            Section(header: Text("Alternate Icon")){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 12){
                    ForEach(alternateAppIcon.indices , id: \.self) { item in
                        Button{
                         print("\(alternateAppIcon[item])was Pressed")
                        } label: {
                            
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        
                        .buttonStyle(.borderless)
                    }
                }
            }// End of ScrollView
                .padding(.top,12)
                
                Text("Choose your Favourite App Icon from Collection Above")
                    .frame(minWidth: 0 , maxWidth:.infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom , 12)
            }
            .listRowSeparator(.hidden)
            
            
            //MARK: - SECTION ABOUT
            Section(
                header: Text("About the App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right Reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
                // 1: Basic Label Content
                
                // 2: Advanced Label Content
                
                CustomRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .pink)
                
                CustomRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Anant", rowTintColor: .mint)
                
                CustomRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Anant", rowTintColor: .pink)
      
                CustomRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,
                rowLinkLabel: "Credo Academy",rowDestinationLink: "https://credo.academy")
              
            }//: End Section
            
        }//: List
    }
}
#Preview {
    SettingView()
}
