//
//  SplashSecondScreen.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 13/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class SplashSecondScreen: UIViewController {
     var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(SplashSecondScreen.splash_Fun2), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
    }
    func splash_Fun2(){
        performSegueWithIdentifier("SplashSecondScreen", sender: self)
        
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
