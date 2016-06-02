//
//  SplashScreenSig.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 27/04/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class SplashScreenSig: UIViewController {
var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(SplashScreenSig.splash_Fun), userInfo: nil, repeats: false)
    }
    
    func splash_Fun(){
    performSegueWithIdentifier("SplashScreenSig", sender: self)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
