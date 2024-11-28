//
//  CustomRowView.swift
//  Hike
//
//  Created by Anant Prajapati on 02/08/24.
//

import SwiftUI

struct CustomRowView: View {
    // MARK:- PROPERTIES
    
    @State var rowLabel : String
    @State var rowIcon : String
    @State var rowContent : String? =  nil
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowDestinationLink : String? = nil
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
            }else if(rowLinkLabel != nil && rowDestinationLink != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowDestinationLink!)!)
                    .foregroundColor(.blue)
                    .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30 , height:  30)
                         .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
                
            }
        }
    }
}

#Preview {
    List{
        CustomRowView(rowLabel: "Website",
                      rowIcon: "globe",
                      rowContent: nil,
                      rowTintColor: .pink,
                      rowLinkLabel: "Credo Academy",
                      rowDestinationLink: "https://credo.academy"
                      )
    }
   
}
