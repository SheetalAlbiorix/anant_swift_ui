//
//  VideoItemList.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct VideoItemListView: View {
    let video : Video
    
    var body: some View {
        HStack(spacing : 10){
            ZStack{
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
                    .cornerRadius(12)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            VStack(alignment:.leading,spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            
        }
        
    }
}

struct VideoItemList_Previews : PreviewProvider{
    static let videos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View{
        VideoItemListView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
