//
//  RatingSizeDetailView.swift
//  E-Commerce App
//
//  Created by Anant Prajapati on 12/09/24.
//

import SwiftUI

struct RatingSizeDetailView: View {
    
    let size : [String] = ["XS","XL","M","S","L"]
    
    var body: some View {
        HStack(alignment: .top,spacing: 3, content: {
            VStack(alignment:.leading,spacing: 3 ,content: {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment:.center,spacing: 3,content:{
                    ForEach(1...5,id: \.self ){ item in
                        Button(action: {}) {
                            Image(systemName: "star.fill")
                                .frame(width: 28,height: 28,alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        }
                    }
                })
            })
            Spacer()
            VStack(alignment:.trailing,spacing: 3 ,content: {
                Text("sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
             
                HStack(alignment:.center,spacing:3,content: {
                    ForEach(size,id: \.self){ size in
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text(size)
                                .frame(width: 28,height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        })
                    }
                })
            })
        })
    }
}



struct RatingSizeDetailView_Previews : PreviewProvider{
    static var previews: some View {
        RatingSizeDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
}
