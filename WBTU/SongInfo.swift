//
//  SongInfo.swift
//  WBTU
//
//  Created by Calvin Rose on 10/27/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import Foundation

class SongInfo {
    
    let dateRegex: NSRegularExpression! = try? NSRegularExpression(pattern: "", options: .CaseInsensitive)
    let titleRegex: NSRegularExpression! = try? NSRegularExpression(pattern: "", options: .CaseInsensitive)
    
    let title: String
    let date: NSDate
    
    init(songData: [String: AnyObject]) {
        self.title = songData["title"] as! String
        self.date = NSDate()
    }
    
    init(title: String, date: NSDate) {
        self.title = title
        self.date = date
    }
    
}
