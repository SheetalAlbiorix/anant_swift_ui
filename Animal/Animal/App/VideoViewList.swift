//
//  VideoViewList.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct VideoViewList: View {
    
   @State var videos : [Video] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoItemListView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{
                        videos.shuffle()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                    
                }
            }
        }
      
       
    }
}


struct VideoViewList_Previews : PreviewProvider{
    static var previews: some View{
        VideoViewList()
    }
}
