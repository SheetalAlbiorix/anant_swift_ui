//
//  HeaderView.swift
//  Avacado
//
//  Created by Anant Prajapati on 17/09/24.
//

import SwiftUI

struct HeaderView: View {
    
    var header : Header
    @State private var showHeadline : Bool = false
    
    var slideAnimation : Animation {
        Animation.spring(response: 1.5 , dampingFraction: 0.5,blendDuration: 0.5)
            .speed(1)
            .delay(0.25)
        
    }
    
    
    var body: some View {
        ZStack{
            Image(header.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            
            HStack(alignment:.top, spacing: 0){
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                
                VStack(alignment:.leading,spacing: 5){
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .foregroundColor(.white)
                    
                    Text(header.subheadline)
                        .font(.system(.subheadline, design: .serif))
                        .foregroundColor(.white)
                }
                .padding(.vertical,.zero)
                .padding(.horizontal,20)
                .frame(width: 280,height: 105)
                .background(Color("ColorBlackTransparentLight"))
            }
            .frame(width: 285,height: 105,alignment: .center)
            .offset(x: -66 ,y:showHeadline ?  75 : 220 )
            .animation(slideAnimation)
            .onAppear(perform: {
                self.showHeadline.toggle()
            })
            
        }
        .frame(width: 480,height: 320,alignment: .center)
            
    }
        
}



    
struct HeaderView_Previews : PreviewProvider {
    static var previews: some View{
        HeaderView(header: headerData[1])
            .previewLayout(.sizeThatFits)
    }
}
