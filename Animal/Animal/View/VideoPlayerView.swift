//
//  VideoPlayerView.swift
//  Animal
//
//  Created by Anant Prajapati on 09/09/24.
//

import SwiftUI
import AVKit
import AVFoundation


struct VideoPlayerView: View {
    
    var videoSelected : String
    var videoTitle : String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected , fileformat: "mp4")){
                
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }
}


struct VideoPlayerView_Preview :PreviewProvider{
    static var previews: some View{
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
