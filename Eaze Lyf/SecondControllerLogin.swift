//
//  SecondControllerLogin.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 27/04/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var p = ""
var i = 0
class SecondControllerLogin: UIViewController ,UITextFieldDelegate {
     var activePlayer = 1
     var isValidMobileNo = 0
    
    @IBOutlet weak var invalidMessageLabel: UILabel!
    
    @IBOutlet weak var mobile_text: UITextField!
    
    @IBOutlet weak var password_text: UITextField!
    
    
    @IBOutlet weak var message_label: UILabel!
    
    @IBAction func checkbox_button(sender: AnyObject) {
        if  activePlayer == 1 && password_text.text != ""{
            
            message_label.text = "Hide Password"
            sender.setImage(UIImage(named: "check.png"), forState: .Normal)
            password_text.secureTextEntry = false;
            activePlayer = 2
            
        }
        else{
            sender.setImage(UIImage(named: "uncheck.png"), forState: .Normal)
            
            password_text.secureTextEntry = true;
            message_label.text = "Show Password"
            activePlayer = 1
            
        }

    }
    
    //override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
    }
   
    @IBAction func login(sender: AnyObject) {
        var mobileNumber = mobile_text.text
        var password = password_text.text
        
        if (mobileNumber == "" && password == ""){
            //invalidMessageLabel.hidden = false
            //invalidMessageLabel.text = "Please Enter Your Mobile And Password"
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Login Failed!"
            alertView.message = "Please Enter Your Mobile And Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }else if(mobileNumber != "" && password == ""){
            //invalidMessageLabel.hidden = false
            //invalidMessageLabel.text = "Invalid Credential"
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Password Blank!"
            alertView.message = "Please Enter Your Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
           
            
        }else if(mobileNumber == ""  && password != ""){
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Mobile Number Blank!"
            alertView.message = "Please Enter Your Mobile Number"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }
        // mobile validation
        /*else if isValidMobileNo(mobileNumber){
            print(mobileNumber)   // this line read when mobie number true
            println("valid")
            
        }*/else if !isValidMobileNo(mobileNumber!)
        {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Invalid Mobile Number!"
            alertView.message = "Please Enter Correct Mobile Number"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        // end mobile validation
        else{
        
            let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/userlogin")
            let request = NSMutableURLRequest(URL: myUrl!)
            
            request.HTTPMethod = "POST"
            
            let postString = "mobileNumber=\(mobileNumber)&password=\(password)"  // this is used to paas the data in url
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                if error != nil {
                    print("error = \(error)")
                    
                    return
                }
                print(response)
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                print("response data = \(responseString)")
                
                var err : NSError?
                var Json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error:&err) as? NSDictionary
                
                if let parseJson = Json{
                    
                    
                    var st = parseJson["status"]! as NSString  // change  remove as NSString
                    p = String(st)
                    
                    if (p == "failed"){
                            var alertView:UIAlertView = UIAlertView()
                            alertView.title = "Invalid Mobile Number!"
                            alertView.message = "This Mobile Number Is Not Registerd"
                            alertView.delegate = self
                            alertView.addButtonWithTitle("OK")
                            alertView.show()
                        
                        self.invalidMessageLabel.text = "Invalid Credential"
                        }
                    else{
                        print("name= \(p)")
                       
            NSOperationQueue.mainQueue().addOperationWithBlock {    // new line added for go to another page
                self.performSegueWithIdentifier("Go_To_OrderPage", sender: self)
                  }
                }
                    
            }
            }
            task.resume()


            
//            func checkLogin(succeed: Bool, msg: String) {
//                if (succeed) {
//                    NSOperationQueue.mainQueue().addOperationWithBlock {
//                        self.performSegueWithIdentifier("logInTrue", sender: self)   // new line
//                    }        
//                }
//            }
            
            
        }

    }
    func isValidMobileNo(mobileNumber:String) -> Bool {
  
        let PHONE_REGEX = "^\\d{10}$"
        
        let mobileTest = NSPredicate(format:"SELF MATCHES %@",PHONE_REGEX )
        
        let result1 = mobileTest.evaluateWithObject(mobileNumber)
        
        return result1

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobile_text.delegate = self
        self.password_text.delegate = self
        invalidMessageLabel.hidden = true
        
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
