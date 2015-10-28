//
//  SongHistoryViewController.swift
//  WBTU
//
//  Created by Calvin Rose on 10/13/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import UIKit

class SongHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var songTableView: UITableView!
    
    var recentlyPlayed: [[String: AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        SpinUtil.getRecentSongs{ songs in
            self.recentlyPlayed = songs
            self.songTableView.reloadData()
            self.songTableView.setNeedsDisplay()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource Methods:
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentlyPlayed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(recentlyPlayed.count)
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("SongHistoryCell", forIndexPath: indexPath)
        let row = indexPath.row
        let songInfo = recentlyPlayed[row]
        
        cell.textLabel!.text = songInfo["title"] as? String
        
        return cell
    }
    
}