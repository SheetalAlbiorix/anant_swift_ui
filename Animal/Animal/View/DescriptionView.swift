//
//  DescriptionView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct DescriptionView: View {
    
    let animal : Animal
    
    var body: some View {
        ScrollView{
            Text(animal.description)
                .padding()
        }
       
    }
}

struct DescriptionView_Previews: PreviewProvider{
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View{
        DescriptionView(animal: animals[0])
    }
}
