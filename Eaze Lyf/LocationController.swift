//
//  LocationController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 05/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var a = ""
var City:String = ""
var Location:String = ""
var Postal_Code:String = ""
class LocationController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var MyPickerView: UIPickerView!
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var locationLable: UILabel!
    
    @IBOutlet weak var postalCodeText: UITextField!
    
    // web service and uipicker view location and city
    
    
    var myDatabase = [
        ["SELECT CITY","KOLKATA"],
        ["SELECT LOCATION","KANKURGACHI","SALT LAKE","KASBA","BELIAGHATA"]
    ]
    
    // for using zipcode
    var zip_code = [
        ["700054","700167","700052","700019"],         //for KANKURGACHI
        ["700091","700135","700156","700016"],         // for SALT LAKE
        ["700019","700039","700107","700099"],         //for KASBA
        ["700091","700105","700014","700016"]          //for BELIAGHATA
    ]
    // end zip code
    
    // for font of picker view
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return myDatabase.count
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDatabase[component].count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return myDatabase[component][row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component)
        print(row)
        switch(component){
        case 0:
            City = myDatabase[component][row]
            cityLable.text = City
            print(City)
            
        case 1:
            Location = myDatabase[component][row]
            locationLable.text = Location
            print(Location)
            
        default:break
            
        }
    }
    // text field adjusted when typing
    var kbHeight: CGFloat!
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LocationController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                kbHeight = keyboardSize.height
                self.animateTextField(true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func animateTextField(up: Bool) {
        let movement = (up ? -kbHeight : kbHeight)
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
    
    // end typing adjustment
    
    @IBAction func DoneButton(sender: AnyObject) {

         a = postalCodeText.text!
        
        // for blank of city and location and fill zip code
        if (City == "" && Location == "" && a == "" ){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "invalid address!"
            alertView.message = "Please Enter Your City, Location And Zip code!!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }
        if (City != "" && Location == "" && a == "" ){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "invalid address!"
            alertView.message = "Please Enter Your Location And Zip code!!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        if (City == "SELECT CITY" && Location == "SELECT LOCATION"){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "invalid address!"
            alertView.message = "Please Select Your CITY And LOCATION!!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        if (City == "SELECT CITY" && Location != "SELECT LOCATION"){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "invalid address!"
            alertView.message = "Please Select Your CITY !!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        if (City != "SELECT CITY" && Location == "SELECT LOCATION"){
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "invalid address!"
            alertView.message = "Please Select Your  LOCATION!!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        // end of blank city and location
        if (City == "KOLKATA" && Location == "KANKURGACHI" ){
            if (zip_code[0][0] == a || zip_code[0][1] == a || zip_code[0][2] == a || zip_code[0][3] == a ) {
                if (zip_code[0][0] == a){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sorry!"
                    alertView.message = "We Are Not Serving In Your Area! We Will Serve Your Area Shortly !!"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }else if(zip_code[0][1] == a){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sorry!"
                    alertView.message = "We Are Not Serving In Your Area! We Will Serve Your Area Shortly !!"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }else if(zip_code[0][2] == a){
                    self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
                }else if(myDatabase[1][1] == "KANKURGACHI" && zip_code[0][3] == a){
                    self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
                    
                }else{
                    
                }
                
            }else{
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "wrong zip code!"
                alertView.message = "This Zip Code Is Not Belongs To KANKURGACHI !"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
                
            }
            
            
        }
        
        // end of kakurgachi area
        
        // for SALT LAKE area
        if (City == "KOLKATA" && Location == "SALT LAKE" ){
            if(zip_code[1][0] == a || zip_code[1][1] == a || zip_code[1][2] == a || zip_code[1][3] == a ){
                self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
            }
                
            else{
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Sorry!"
                alertView.message = "This Zip Code Is Not Belongs To SALT LAKE In Our Service Area !!"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
            }
        }
        // end of SALT LAKE area
        // for KASBA area
        if (City == "KOLKATA" && Location == "KASBA" ){
            if( zip_code[2][0] == a || zip_code[2][1] == a || zip_code[2][2] == a || zip_code[2][3] == a  ){
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Sorry!"
                alertView.message = "We Are Not Serving In Your Area! We Will Serve Your Area Shortly !!"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
            }else{
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "wrong zip code!"
                alertView.message = "This Zip Code Is Not Belongs To KASBA !"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
            }
            
        }
        // end KASBA area
        // for BELIAGHATA area
        if (City == "KOLKATA" && Location == "BELIAGHATA" ){
            if (myDatabase[1][4] == "BELIAGHATA" && zip_code[3][0] == a){
                self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
            }
            if (myDatabase[1][4] == "BELIAGHATA" && zip_code[3][1] == a){
                self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
            }
            if (myDatabase[1][4] == "BELIAGHATA" && zip_code[3][2] == a){
                self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
            }
            if (myDatabase[1][4] == "BELIAGHATA" && zip_code[3][3] == a){
                self.performSegueWithIdentifier("deliveryToOrderpage", sender: self)  // redirect to order page
            }
            else{
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "wrong zip code!"
                alertView.message = "This Zip Code Is Not Belongs To BELIAGHATA !"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
                
            }
        }
        
        // end of BELIAGHATA area
        
        
    }

    
    // end web service and uipicker view location and city
    
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
//    {
//        var MyPickerView = UILabel()
//        MyPickerView.textColor = UIColor.blackColor()
//        MyPickerView.text = "Select Your City"
//        //MyPickerView.font = UIFont(name: MyPickerView.font.fontName, size: 15)
//        MyPickerView.font = UIFont(name: "Arial-BoldMT", size: 12) // In this use your custom font
//        MyPickerView.textAlignment = NSTextAlignment.Center
//        return MyPickerView
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // start picker view font
        
        // start picker view font
        
        // used to change the placeholder color
        postalCodeText.attributedPlaceholder = NSAttributedString(string:"Enter your postal code",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        // end color of place holder
        self.postalCodeText.delegate = self
        
        // fetch Location
        let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/fetchlocation")
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error != nil {
                print("error = \(error)")
                
                return
            }
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("response data = \(responseString)")
            
            let Json:NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
            
                
                //var names = [String]()
                if let blogs = Json["citylist"] as? [[String: AnyObject]] {
                    for blog in blogs {
                        if let cityid = blog["cityid"] as? String {
                            if blogs.count > 0 {
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    //CityIdLabel.text = (cityid as String)
                                    print("jhgdjhsagdjhgsadhgsakdaskj = \(cityid)")
                                    
                                })
                            }
                        }
                        if (blog["cityname"] as? String) != nil   {
                            if blogs.count > 0 {
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    //  self.cityNameLabel.text = (name as String)
                                    //println(blog["cityname"])
                                    print(blog["arealist"])    // to print area list
                                    
                                    
                                })
                            }
                        }
                        
                                           }
                    
                }
                
            
        }
        
        
        task.resume()

        // end fetch Location
        
    }
   // override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
