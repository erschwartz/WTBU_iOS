//
//  RadioViewController.swift
//  WBTU
//
//  Created by Calvin Rose on 10/13/15.
//  Copyright © 2015 Calvin Rose. All rights reserved.
//

import UIKit
import SwiftyJSON

class RadioViewController: UIViewController {
    
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var imageCoverArt: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}