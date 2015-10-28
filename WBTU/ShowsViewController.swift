//
//  ShowsViewController.swift
//  WBTU
//
//  Created by Calvin Rose on 10/13/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var showTableView: UITableView!
    
    let showsArray = ["a","b","c","d","e","f","g","h"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("showTableViewCell", forIndexPath: indexPath) as! ShowTableViewCell
        cell.showName.text = showsArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
