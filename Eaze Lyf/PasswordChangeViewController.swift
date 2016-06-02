//
//  PasswordChangeViewController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 10/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class PasswordChangeViewController: UIViewController {

    @IBOutlet weak var oldPassword: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var confermPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func UpdatePassword(sender: AnyObject) {
        if oldPassword.text == "" && newPassword.text == "" && confermPassword.text == "" {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Required Field!"
            alertView.message = "Please enter Old password, New password and Conferm password field"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
            
        else if oldPassword.text != "" && newPassword.text == "" && confermPassword.text == "" {
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your New password and Conferm password field!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
            
        else if oldPassword.text != "" && newPassword.text != "" && confermPassword.text == "" {
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Your Conferm password field!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        else if oldPassword.text != "" && newPassword.text == "" && confermPassword.text != "" {
            var alertView:UIAlertView = UIAlertView()
           // alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter New password Field!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        else if oldPassword.text == "" && newPassword.text != "" && confermPassword.text != "" {
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Old password field! "
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
       /* else if !isValidMobileNo(Mobile.text)
        {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Invalid Mobile Number!"
            alertView.message = "Please Enter Correct Mobile Number"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } */
//        else if (newPassword.text != confermPassword.text){
//            
//            var alertView:UIAlertView = UIAlertView()
//            alertView.title = "Check Your Password!"
//            alertView.message = "Your Password Does Not Matched Please Retry"
//            alertView.delegate = self
//            alertView.addButtonWithTitle("OK")
//            alertView.show()
//        
//        
//        }
        else if oldPassword.text != "" && newPassword.text != "" && confermPassword.text != "" {
        let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/changepassword")
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        
        let postString = "phonenumber=\(oldPassword.text)&oldpassword=\(newPassword.text)&newpassword=\(confermPassword.text)"  // this is used to paas the data in url
            print(postString)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error != nil {
                print("error = \(error)")
                
                return
            }
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("response data = \(responseString)")
            
            
            let Json:NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
            
            
                let st = Json["status"] as! Bool  // change  remove as NSString
                let password_change_status = (st)
                
                if (password_change_status == false){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Invalid Entry!"
                    alertView.message = "Please Check Your Mobile Number And Password"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                    
                }
                else{
                    
                    //NSOperationQueue.mainQueue().addOperationWithBlock {    // new line added for go to another page
                   //     self.performSegueWithIdentifier("SignUp_To_Login", sender: self)
                   // }
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Success!"
                    alertView.message = "Your Password Changed Successfully"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }
                
                
            
            
        }
        task.resume()
    
    }
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
