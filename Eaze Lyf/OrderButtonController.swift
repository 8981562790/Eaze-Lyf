//
//  OrderButtonController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 04/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class OrderButtonController: UIViewController {
    
    
    @IBOutlet weak var OutSide_Button_label: UIButton!
    
    @IBOutlet var myprofileButton: UIButton!
    
    @IBOutlet weak var Message_Label_welcome: UILabel!

    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var LocationButton: UIButton!
    
    
    @IBOutlet weak var OrderTrackingButton: UIButton!
    
    @IBOutlet weak var DealsButton: UIButton!
    
    @IBOutlet weak var InfoButton: UIButton!
    
    @IBOutlet weak var LogoutButton: UIButton!
    
    @IBOutlet weak var loginImg: UIButton!
    
    @IBOutlet weak var locationImg: UIButton!
    
    @IBOutlet weak var myorederImg: UIButton!
    
    @IBOutlet weak var dealsImg: UIButton!
    
    @IBOutlet weak var infoImg: UIButton!
    
    @IBOutlet weak var logoutImg: UIButton!
    
    //button Outlets
    
    @IBOutlet weak var regularButton: UIButton!
    @IBOutlet weak var subscribedButton: UIButton!
    @IBOutlet weak var partyButton: UIButton!
    @IBOutlet weak var orderButton1: UIButton!
    @IBOutlet weak var Bottom_View: UIView!
    // view
    @IBOutlet weak var abc: UIView!
    @IBOutlet weak var topView: UIView!
    
    
    var count = true
    var count2 = 5
    override func viewDidLoad() {
        super.viewDidLoad()

        if ( p != "" ){
            Message_Label_welcome.text = ("Welcome \(p)")

        }else{
            Message_Label_welcome.text = ("Welcome Guest")
            logoutImg.hidden = false
            LogoutButton.hidden = false
        }
        
        // for loading the animation menus
        menuLabel.hidden = true
        LoginButton.hidden = true
        LocationButton.hidden = true
        OrderTrackingButton.hidden = true
        DealsButton.hidden = true
        InfoButton.hidden = true
        LogoutButton.hidden = true
        OutSide_Button_label.hidden = true
        myprofileButton.hidden = true
        
        //for hidding Imahe Button
        loginImg.hidden = true
        locationImg.hidden = true
        myorederImg.hidden = true
        dealsImg.hidden = true
        infoImg.hidden = true
        logoutImg.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Animated Drober menues
    
    @IBAction func Drober_Menue_Button(sender: AnyObject) {
        menuLabel.hidden = false ;
        LoginButton.hidden = false ;
        LocationButton.hidden = false
        OrderTrackingButton.hidden = false
        DealsButton.hidden = false
        InfoButton.hidden = false
        LogoutButton.hidden = false
        
        loginImg.hidden = false
        locationImg.hidden = false
        myorederImg.hidden = false
        dealsImg.hidden = false
        infoImg.hidden = false
        logoutImg.hidden = false
        OutSide_Button_label.hidden = false
        if ( p != "" ){
            LogoutButton.hidden = false
            logoutImg.hidden = false
            LoginButton.hidden = true
            myprofileButton.hidden = false
        }else{
            LogoutButton.hidden = true
            logoutImg.hidden = true
        }
        if count == true && count2 == 5 {
            /*UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OutSide_Button_label.center = CGPointMake(self.OutSide_Button_label.center.x + -500 , self.OutSide_Button_label.center.y)
            })

            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.menuLabel.center = CGPointMake(self.menuLabel.center.x + -500 , self.menuLabel.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.loginImg.center = CGPointMake(self.loginImg.center.x + -500 , self.loginImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.locationImg.center = CGPointMake(self.locationImg.center.x + -500 , self.locationImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myorederImg.center = CGPointMake(self.myorederImg.center.x + -500 , self.myorederImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.dealsImg.center = CGPointMake(self.dealsImg.center.x + -500 , self.dealsImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.infoImg.center = CGPointMake(self.infoImg.center.x + -500 , self.infoImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.logoutImg.center = CGPointMake(self.logoutImg.center.x + -500 , self.logoutImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LoginButton.center = CGPointMake(self.LoginButton.center.x + -500 , self.LoginButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LocationButton.center = CGPointMake(self.LocationButton.center.x + -500 , self.LocationButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OrderTrackingButton.center = CGPointMake(self.OrderTrackingButton.center.x + -500 , self.OrderTrackingButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.DealsButton.center = CGPointMake(self.DealsButton.center.x + -500 , self.DealsButton.center.y)
                
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.InfoButton.center = CGPointMake(self.InfoButton.center.x + -500 , self.InfoButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LogoutButton.center = CGPointMake(self.LogoutButton.center.x + -500 , self.LogoutButton.center.y)
                
            })
            
            
            println(self.count)
            count = false
            self.Bottom_View.backgroundColor = UIColor.lightGrayColor()
            self.abc.backgroundColor = UIColor.whiteColor()  */
            count2 += 1
            
        }else if (count == true && count2 != 5){
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myprofileButton.center = CGPointMake(self.myprofileButton.center.x + -500 , self.myprofileButton.center.y)
            })

            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.OutSide_Button_label.center = CGPointMake(self.OutSide_Button_label.center.x + -500 , self.OutSide_Button_label.center.y)
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.menuLabel.center = CGPointMake(self.menuLabel.center.x + -500 , self.menuLabel.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.loginImg.center = CGPointMake(self.loginImg.center.x + -500 , self.loginImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.locationImg.center = CGPointMake(self.locationImg.center.x + -500 , self.locationImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.myorederImg.center = CGPointMake(self.myorederImg.center.x + -500 , self.myorederImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.dealsImg.center = CGPointMake(self.dealsImg.center.x + -500 , self.dealsImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.infoImg.center = CGPointMake(self.infoImg.center.x + -500 , self.infoImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.logoutImg.center = CGPointMake(self.logoutImg.center.x + -500 , self.logoutImg.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.LoginButton.center = CGPointMake(self.LoginButton.center.x + -500 , self.LoginButton.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.LocationButton.center = CGPointMake(self.LocationButton.center.x + -500 , self.LocationButton.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.OrderTrackingButton.center = CGPointMake(self.OrderTrackingButton.center.x + -500 , self.OrderTrackingButton.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.DealsButton.center = CGPointMake(self.DealsButton.center.x + -500 , self.DealsButton.center.y)
            
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.InfoButton.center = CGPointMake(self.InfoButton.center.x + -500 , self.InfoButton.center.y)
            
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.LogoutButton.center = CGPointMake(self.LogoutButton.center.x + -500 , self.LogoutButton.center.y)
            
            })
            
            
            print(self.count)
            count = false
            self.Bottom_View.backgroundColor = UIColor.lightGrayColor()
            self.abc.backgroundColor = UIColor.whiteColor()
        
        
        }
        else{
            print(self.count)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myprofileButton.center = CGPointMake(self.myprofileButton.center.x + 500 , self.myprofileButton.center.y)
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OutSide_Button_label.center = CGPointMake(self.OutSide_Button_label.center.x + 500 , self.OutSide_Button_label.center.y)
            })

            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.menuLabel.center = CGPointMake(self.menuLabel.center.x + 500 , self.menuLabel.center.y)
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.loginImg.center = CGPointMake(self.loginImg.center.x + 500 , self.loginImg.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.locationImg.center = CGPointMake(self.locationImg.center.x + 500 , self.locationImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myorederImg.center = CGPointMake(self.myorederImg.center.x + 500 , self.myorederImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.dealsImg.center = CGPointMake(self.dealsImg.center.x + 500 , self.dealsImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.infoImg.center = CGPointMake(self.infoImg.center.x + 500 , self.infoImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.logoutImg.center = CGPointMake(self.logoutImg.center.x + 500 , self.logoutImg.center.y)
                
            })

            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LoginButton.center = CGPointMake(self.LoginButton.center.x + 500 , self.LoginButton.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LocationButton.center = CGPointMake(self.LocationButton.center.x + 500 , self.LocationButton.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OrderTrackingButton.center = CGPointMake(self.OrderTrackingButton.center.x + 500 , self.OrderTrackingButton.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.DealsButton.center = CGPointMake(self.DealsButton.center.x + 500 , self.DealsButton.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.InfoButton.center = CGPointMake(self.InfoButton.center.x + 500 , self.InfoButton.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LogoutButton.center = CGPointMake(self.LogoutButton.center.x + 500 , self.LogoutButton.center.y)
            })
            
            count = true
            
            //self.abc.backgroundColor = UIColor.grayColor()
            //self.Bottom_View.backgroundColor = UIColor.grayColor()
           // self.regularButton.backgroundColor = UIColor.grayColor()
            //self.partyButton.backgroundColor = UIColor.grayColor()
           // self.orderButton1.backgroundColor = UIColor.grayColor()
           // self.subscribedButton.backgroundColor = UIColor.grayColor()
            self.topView.backgroundColor = UIColor.whiteColor()
        }

    
    }
    
    
    
    // End Of Animated Drober menues
    
    @IBAction func Logout_Button_function(sender: AnyObject) {
    
        p = ""
        
    }
    // start out side click button
    
    @IBAction func OutSideClickButton(sender: AnyObject) {
        if count == true  {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OutSide_Button_label.center = CGPointMake(self.OutSide_Button_label.center.x + -500 , self.OutSide_Button_label.center.y)
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.menuLabel.center = CGPointMake(self.menuLabel.center.x + -500 , self.menuLabel.center.y)
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.loginImg.center = CGPointMake(self.loginImg.center.x + -500 , self.loginImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.locationImg.center = CGPointMake(self.locationImg.center.x + -500 , self.locationImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myorederImg.center = CGPointMake(self.myorederImg.center.x + -500 , self.myorederImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.dealsImg.center = CGPointMake(self.dealsImg.center.x + -500 , self.dealsImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.infoImg.center = CGPointMake(self.infoImg.center.x + -500 , self.infoImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.logoutImg.center = CGPointMake(self.logoutImg.center.x + -500 , self.logoutImg.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LoginButton.center = CGPointMake(self.LoginButton.center.x + -500 , self.LoginButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LocationButton.center = CGPointMake(self.LocationButton.center.x + -500 , self.LocationButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.OrderTrackingButton.center = CGPointMake(self.OrderTrackingButton.center.x + -500 , self.OrderTrackingButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.DealsButton.center = CGPointMake(self.DealsButton.center.x + -500 , self.DealsButton.center.y)
                
            })
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.InfoButton.center = CGPointMake(self.InfoButton.center.x + -500 , self.InfoButton.center.y)
                
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.LogoutButton.center = CGPointMake(self.LogoutButton.center.x + -500 , self.LogoutButton.center.y)
                
            })
            
            
            print(self.count)
            count = false
            self.Bottom_View.backgroundColor = UIColor.lightGrayColor()
            self.abc.backgroundColor = UIColor.whiteColor()
            //self.LocationButton.backgroundColor = UIColor.grayColor()
            
        }
    
    
    
    
    }
    
    // end of out side click button

    @IBAction func RegularButton(sender: AnyObject) {
    self.performSegueWithIdentifier("GoToOrderToDetails", sender: self)
    }

    @IBAction func WeekendSpecielButton(sender: AnyObject) {
        //(sender as UIButton).backgroundColor = UIColor.greenColor()      chang button color
        let alertView:UIAlertView = UIAlertView()
        //alertView.title = "Invalid Mobile Number!"
        alertView.message = "Whould you like call our customer center?"
        alertView.delegate = self
        alertView.addButtonWithTitle("NO")
        alertView.addButtonWithTitle("CALL")
        alertView.show()
    
    }
    
    @IBAction func PartyOrderButton(sender: AnyObject) {
        let alertView:UIAlertView = UIAlertView()
        //alertView.title = "Invalid Mobile Number!"
        alertView.message = "Whould you like call our customer center?"
        alertView.delegate = self
        alertView.addButtonWithTitle("NO")
        alertView.addButtonWithTitle("CALL")
        alertView.show()
        

    }
    
    @IBAction func SubscribeButton(sender: AnyObject) {
        if (p == ""){
    self.performSegueWithIdentifier("GoToLoginPage", sender: self)
        }else{
            self.performSegueWithIdentifier("GoToTakeSlotPage", sender: self)
        }
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
