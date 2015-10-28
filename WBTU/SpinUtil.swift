//
//  SpinUtil.swift
//
//  Utility functions to get WTBU information over the internet easily.
//
//  WBTU
//
//  Created by Calvin Rose on 10/20/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import SwiftHTTP
import SWXMLHash

let rssURL = "https://spinitron.com/radio/rss.php?station=wtbu"

struct SpinUtil {
    
    // Takes an Array of Dictionaries and inputs information on the songs recently played.
    // The Array is initially empty, and is populated when the data is recieved and parsed from
    // the Spinitron website. Also can take an optional callback for when the loading is complete.
    static func getRecentSongs(onFinish: ([[String: AnyObject]] -> Void)?)  {
        var ret = [[String: AnyObject]]()
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let opt = try HTTP.GET(rssURL)
                opt.start{ response in
                    if let error = response.error {
                        print("Error getting RSS feed data: \(error)")
                        return //also notify app of failure as needed
                    }
                    let rssContent = response.data
                    let xml = SWXMLHash.parse(rssContent)
                    
                    // Currently, only gets title and date published
                    for item in xml["rss"]["channel"]["item"] {
                        let dateString: String = (item["pubDate"].element?.text)!
                        let itemMap = [
                            "title": (item["title"].element?.text)!,
                            "data": dateString
                        ]
                        ret.append(itemMap)
                    }
                    // Call the optional callback
                    
                    if let f = onFinish {
                        dispatch_async(dispatch_get_main_queue()) { f(ret) }
                    }
                }
            } catch let error {
                print("Error getting RSS feed data: \(error)")
            }
        }
    }
}