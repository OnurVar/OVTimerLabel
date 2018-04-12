//
//  OVTimerLabel.swift
//  OVTimerLabel
//
//  Created by Onur Var on 12.04.2018.
//

import UIKit

public class OVTimerLabel: UILabel {

    
    //MARK: Public's
    public var isHoursEnabled = true
    public var seperator = ":"
    
    //MARK: Private's
    fileprivate var timer : Timer!
    fileprivate var date : Date!
    
    
    //MARK: Public Methods
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "DBLCDTempBlack", size: 20.0)
        self.text = isHoursEnabled ? String(format: "00%@00%@00", seperator,seperator) : String(format: "00%@00", seperator)
    }
    
    public func set(date: Date){
        self.date = date
    }
   
    
    public func startTimer(){
        if date == nil {
            date = Date()
        }
        startScheduledTimer()
    }
    
    public func stopTimer(){
        stopScheduledTimer()
    }
    
    
    //MARK: Private Methods
    
    fileprivate func stopScheduledTimer(){
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    fileprivate func startScheduledTimer(){
        //Make sure you stop it first
        stopScheduledTimer()
        
        //Initialize Timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(didTimerTrigger(_:)), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc fileprivate func didTimerTrigger(_ timer: Timer){
        
        var checkDate : Date!
        if let date = date {
            checkDate = date
        }

        var interval = Double(Date().timeIntervalSince(checkDate))
        if interval < 0 {
            interval = interval * (-1)
        }
        
        
        let hours   = Int(interval / 3600)
        let minutes = Int((interval - Double(hours   * 60)) / 60)
        let seconds = Int(interval - Double(minutes * 60) - Double(hours * 60))
        
        self.text = String(format: "%02d%@%02d%@%02d",hours,seperator,minutes,seperator,seconds)
        
    }
    
    
    
}

