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

    @IBOutlet weak var lblTimer1: OVTimerLabel!
    @IBOutlet weak var lblTimer2: OVTimerLabel!
    @IBOutlet weak var lblTimer3: OVTimerLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTimer1.resetTimer()
        lblTimer2.resetTimer()
        lblTimer3.resetTimer()
        
        
        lblTimer3.setInterval(interval: Double(54))
    }

    deinit {
        lblTimer1.stopTimer()
        lblTimer2.stopTimer()
        lblTimer3.stopTimer()
    }
    
  
    @IBAction func btnLabel1Tapped(_ sender: Any) {
        lblTimer1.startTimer()
    }
    
    
    @IBAction func btnLabel2Tapped(_ sender: Any) {
        lblTimer2.setInterval(interval: Double(75))
    }
    
    
    @IBAction func btnLabel3Tapped(_ sender: Any) {
        lblTimer3.startTimer()
    }
}

