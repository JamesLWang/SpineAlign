//
//  ScanController.swift
//  SpineAlign
//
//  Created by Havi Nguyen on 2/2/19.
//  Copyright © 2019 Havi Nguyen. All rights reserved.
//

import UIKit
import CoreMotion

class ScanController: UIViewController {
    
    var motion = CMMotionManager()
    var motionLog: [Double] = []
    var isRecording = true
    var maxAngle: Double = 0
    @IBOutlet weak var stopScanButton: UIButton!
    
    
    @IBAction func stopScanButton(_ sender: Any) {
        print("Stop Scanning Button is Pressed")
        isRecording = false
        stopGyros()
        analysis()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isRecording == true){
            print("Execute")
            recordData()
        }
    }
    
    
    func recordData(){
        motion.deviceMotionUpdateInterval  = 0.5
        motion.startDeviceMotionUpdates(to: OperationQueue.current!) {
            (data,error) in
            print(data as Any)
            if let trueData =  data {
                self.view.reloadInputViews()
                let mPitch = trueData.attitude.pitch
                print(mPitch.rounded(toPlaces: 3)*180/M_PI)
                self.motionLog.append(mPitch.rounded(toPlaces: 3)*180/M_PI)
                print("----------")
                print(self.motionLog)
            }
        }
        return
    }
    
    func analysis(){
        print("Running analysis")
        for i in 0...(motionLog.count-3){
            motionLog[i] = abs(motionLog[i])
        }
        let maxAngle = motionLog.max()
        print(maxAngle)
        UserDefaults.standard.setValue(maxAngle, forKey: "maxAngle")
        motionLog = []
    }
    
    func stopGyros(){
        self.motion.stopDeviceMotionUpdates()
        
    }
    
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
