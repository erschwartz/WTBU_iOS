//
//  SongHistoryViewController.swift
//  WBTU
//
//  Created by Calvin Rose on 10/13/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import UIKit

class SongHistoryViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //added Spinatron website to the songhistory tab
        //We probably want to change this,
        let url = NSURL(string: "http://spinitron.com/radio/playlist.php?station=wtbu&showid=662")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            { (data, response, error) -> Void in
        
            if error == nil {
                
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(urlContent)
                dispatch_async(dispatch_get_main_queue())
                    {
                        self.webView.loadHTMLString(urlContent as String!, baseURL: url)
                    }
                
                
            }
            
            
        }
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}