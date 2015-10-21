//
//  RadioPlayer.swift
//  WBTU
//
//  Created by Ben Cootner on 10/20/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    private var player = AVPlayer(URL: NSURL(string: "http://wtbu.bu.edu:1800/listen.m3u")!)
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func volume(value:Float){
        player.volume = value
        
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
    
}

