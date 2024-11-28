//
//  CustomShape.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in react: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: react, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
        
    }
}


struct CustomShape_Previews : PreviewProvider{
    static var previews: some View{
        CustomShape()
            .previewLayout(.fixed(width: 428, height: 120))
            .padding()
            
    }
}
