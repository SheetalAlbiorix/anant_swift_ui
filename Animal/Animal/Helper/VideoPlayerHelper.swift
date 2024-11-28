//
//  VideoPlayerHelper.swift
//  Animal
//
//  Created by Anant Prajapati on 09/09/24.
//

import AVFoundation
import AVKit
import SwiftUI



var videoPlayer: AVPlayer?

func playVideo(filename : String ,fileformat: String) -> AVPlayer {
    
    if Bundle.main.url(forResource: filename, withExtension: fileformat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileformat)!)
        videoPlayer?.play()
        
    }
    return videoPlayer!
}
