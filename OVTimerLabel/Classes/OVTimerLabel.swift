//
//  OVTimerLabel.swift
//  OVTimerLabel
//
//  Created by Onur Var on 12.04.2018.
//

import UIKit

@IBDesignable
open class OVTimerLabel: UILabel {

    
    //MARK: open's
    @IBInspectable open var isHoursEnabled : Bool = true
    @IBInspectable open var resetOnStopTimer : Bool = false
    @IBInspectable open var seperator : String = ":"
    
    //MARK: Private's
    fileprivate var timer : Timer!
    fileprivate var date : Date!{
        didSet{
            setTimerLabel()
        }
    }
    
    //MARK: View Life Cycle
    
    deinit {
        stopScheduledTimer()
    }
    
    //MARK: open Methods
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "DBLCDTempBlack", size: 20.0)
        resetTimer()
    }
    
    open func set(date: Date){
        self.date = date
    }
    
    open func startTimer(){
        if date == nil {
            date = Date()
        }
        startScheduledTimer()
    }
    
    open func stopTimer(){
        stopScheduledTimer()
    }
    
    open func resetTimer(){
        self.text = isHoursEnabled ? String(format: "00%@00%@00", seperator,seperator) : String(format: "00%@00", seperator)
    }
    
    open func set(font: UIFont){
        self.font = font
    }
    
    open func set(fontSize: CGFloat){
        self.font = self.font.withSize(fontSize)
    }

    
    //MARK: Private Methods
    
    fileprivate func stopScheduledTimer(){
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        
        if resetOnStopTimer {
            resetTimer()
        }
    }
    
    fileprivate func startScheduledTimer(){
        //Make sure you stop it first
        stopScheduledTimer()
        
        //Initialize Timer
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.didTimerTrigger(_:)), userInfo: nil, repeats: true)
            self.timer.fire()
        }
    }
    
    @objc fileprivate func didTimerTrigger(_ timer: Timer){
        setTimerLabel()
    }
    
    func setTimerLabel(){
        var checkDate : Date!
        if let date = date {
            checkDate = date
        }
        
        var interval = Double(Date().timeIntervalSince(checkDate))
        if interval < 0 {
            interval = interval * (-1)
        }
        interval = ceil(interval)
        
        let hours   = Int(interval / 3600)
        let minutes = Int((interval - Double(hours   * 3600)) / 60)
        let seconds = Int(interval - Double(minutes * 60) - Double(hours * 3600))
        
        self.text = isHoursEnabled ? String(format: "%02d%@%02d%@%02d",hours,seperator,minutes,seperator,seconds) : String(format: "%02d%@%02d",minutes,seperator,seconds)
        
    }
    
    
}

