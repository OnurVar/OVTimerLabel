//
//  ViewController.swift
//  OVTimerLabel
//
//  Created by OnurVar on 04/12/2018.
//  Copyright (c) 2018 OnurVar. All rights reserved.
//

import UIKit
import OVTimerLabel

class ViewController: UIViewController {

    @IBOutlet weak var lblTimer: OVTimerLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblTimer.set(date: Date().addingTimeInterval(60000))
//        lblTimer.isHoursEnabled = false
        lblTimer.startTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        lblTimer.stopTimer()
    }
}

