//
//  SignupController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 27/04/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var jjj = true
class SignupController: UIViewController,UITextFieldDelegate {
    var activePlayer = 1
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Mobile: UITextField!
    @IBOutlet weak var messge_label: UILabel!
    @IBOutlet weak var password_text: UITextField!
    var isValidMobileNo = 0
    
    @IBAction func check_uncheck_button(sender: AnyObject) {
        if  activePlayer == 1 && password_text.text != ""{
            
            messge_label.text = "Hide Password"
            sender.setImage(UIImage(named: "check.png"), forState: .Normal)
            password_text.secureTextEntry = false;
            activePlayer = 2
            
        }
        else{
            sender.setImage(UIImage(named: "uncheck.png"), forState: .Normal)
            
            password_text.secureTextEntry = true;
            messge_label.text = "Show Password"
            activePlayer = 1
            
        }

    }
    
    @IBAction func SignUP_Button(sender: AnyObject) {
       
        if Name.text == "" && Mobile.text == "" && password_text.text == "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Name, Mobile and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        else if Name.text != "" && Mobile.text == "" && password_text.text == "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your Mobile and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        else if Name.text != "" && Mobile.text != "" && password_text.text == "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        else if Name.text != "" && Mobile.text == "" && password_text.text != "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your Mobile"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        else if Name.text == "" && Mobile.text != "" && password_text.text != "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your Valid Email "
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        /*else if isValidMobileNo(mobileNumber){
            print(mobileNumber)   // this line read when mobie number true
            println("valid")
            
        }*/else if !isValidMobileNo(Mobile.text!)
        {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Invalid Mobile Number!"
            alertView.message = "Please Enter Correct Mobile Number"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        else if Name.text != "" && Mobile.text != "" && password_text.text != "" {

        let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/signup")
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        
        let postString = "name=\(Name.text)&contactnumber=\(Mobile.text)&password=\(password_text.text)"  // this is used to paas the data in url
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error != nil {
                print("error = \(error)")
                
                return
            }
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("response data = \(responseString)")
            
            var err : NSError?
            var Json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error:&err) as? NSDictionary
            if let parseJson = Json{
                
                
                var st = parseJson["status"]! as Bool  // change  remove as NSString
                jjj = (st)
                
                if (jjj == false){
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Check Mobile Number!"
                    alertView.message = "This Mobile Number Is Already registerd"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()

                    
                }
                else{
                    
                    NSOperationQueue.mainQueue().addOperationWithBlock {    // new line added for go to another page
                        self.performSegueWithIdentifier("SignUp_To_Login", sender: self)
                    }
                   
                }
                
                
            }
            
        }
        task.resume()
            
        }
    }
    
    
    //override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
    }
    func isValidMobileNo(mobileNumber:String) -> Bool {
        
        let PHONE_REGEX = "^\\d{10}$"
        
        let mobileTest = NSPredicate(format:"SELF MATCHES %@",PHONE_REGEX )
        
        let result1 = mobileTest.evaluateWithObject(Mobile.text)
        
        return result1
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.Name.delegate = self
     self.Mobile.delegate = self
     self.password_text.delegate = self
        // Do any additional setup after loading the view.
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
