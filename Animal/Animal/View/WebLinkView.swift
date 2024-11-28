//
//  WebLinkView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct WebLinkView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
           
        }
        
    }
}

struct WebLinkView_Previews: PreviewProvider{
    

    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View{
        WebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
