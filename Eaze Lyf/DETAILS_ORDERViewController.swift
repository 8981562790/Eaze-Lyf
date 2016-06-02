//
//  DETAILS_ORDERViewController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 19/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var orderIndexPath = 0
var orderPrice = ""
var orderDetails = ""
var orderQnty = ""
var lunchTime = ""
var dinnerTime = ""

var custName = ""
var custContact = ""
var custDelivery = ""
var cuxtDeladd = ""
var custPin = ""
var custIns = ""
var chnglabl = ""
class DETAILS_ORDERViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var sv = true
    
    var activePlayer = 1
    
    @IBOutlet weak var TotalQuanLabel: UILabel! // not use hidden label
    
    @IBOutlet weak var TotalPriceLabel: UILabel!  // not use hidden label
    
    @IBOutlet weak var NameText: UITextField!
    
    @IBOutlet weak var ContactText: UITextField!
    
    
    @IBOutlet weak var DeliveryText: UITextField!
    
    @IBOutlet weak var DeliveryAddresstext: UITextField!
    
    
    @IBOutlet weak var PinCodeText: UILabel!
    
    @IBOutlet weak var InstructionText: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var LunchDinner: UIButton!
    @IBOutlet weak var slotView: UIView!
    @IBOutlet weak var lunchAndDinner: UIButton!
    @IBOutlet weak var Lunch: UIButton!
    @IBOutlet weak var Dinner: UIButton!
    
    @IBOutlet weak var ChangeLabel: UILabel!
    
    // SLOT
    @IBOutlet weak var SelectTimesSlotbutton: UIButton!
    
    @IBOutlet weak var SLOTVIEW: UIView!
    @IBOutlet weak var SELECTTIMESOUTLETS: UIView!
    
    @IBOutlet weak var out11to12: UIView!
    
    @IBOutlet weak var out12to01: UIView!
    
    @IBOutlet weak var out01to2: UIButton!
    
    @IBOutlet weak var out02to03: UIButton!
    
    @IBOutlet weak var out03to04: UIButton!
    
    @IBOutlet weak var selecttimesslot: UILabel!
    
    // END SLOT OUTLETS
    
    // FOR DINNER
    @IBOutlet weak var DINNERselecttimeslot: UIButton!
    
    @IBOutlet weak var DinnerslotView: UIView!
    
    @IBOutlet weak var sevenToEight: UIButton!
    
    @IBOutlet weak var eightToNine: UIButton!
    
    
    @IBOutlet weak var NINETOten: UIButton!
    
    
    @IBOutlet weak var tenToEleven: UIButton!
    
    @IBOutlet weak var elevenTo12: UIButton!
    
    @IBOutlet weak var dinnerChangeLabel: UILabel!
  
    // END OF DINNER
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PinCodeText.text = a
        
        // for hidden drop down
        slotView.hidden = true
        lunchAndDinner.hidden = true
        Lunch.hidden = true
        Dinner.hidden = true
        ChangeLabel.hidden = true
        
        SelectTimesSlotbutton.hidden = true
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
        selecttimesslot.hidden = true
        
        // for dinner
       dinnerChangeLabel.hidden = true
       DINNERselecttimeslot.hidden = true
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
        // end of dinner outlets
        
        // end drop down
        //TotalPriceLabel.text = TPonCart
        //TotalQuanLabel.text = ("\(quantityOnCart)")

        
    // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // place order calculation
  
    @IBAction func PlaceOrderButton(sender: AnyObject) {
       // user form
         custName = NameText.text!
        
         custContact = ContactText.text!
        
        
         custDelivery = DeliveryText.text!
        
        cuxtDeladd = DeliveryAddresstext.text!
        
        
         custPin = PinCodeText.text!
        
         custIns = InstructionText.text!


        // end user form
        if (lunchTime == ""){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Select Your Lunch/Dinner !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }else if ( selecttimesslot.text == "" ){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Select Your Lunch Time !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }else if ( selecttimesslot.text == "" ){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Select Your Lunch Time !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
        }else if ( NameText.text == "" ){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Enter Your Name !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()

        }else if( ContactText.text == ""){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Enter Your Mobile Number !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()

        
        }else if( DeliveryText.text == "" ){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Enter Your Deleviery Zone !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()

        
        }else if( DeliveryAddresstext.text == "" ){
            var alertView:UIAlertView = UIAlertView()
            //alertView.title = "Sorry!"
            alertView.message = "Please Enter Your Deleviery Address !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            
            
        }else{
           
        let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/placeOrder")
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        
        let postString = "mobileno=\(custContact)&name=\(custName)&usermailId=khan.rehan9038@gmail.com&cityName=\(City)&deliverypincode=700156&fooddetails[]=\(Comibinationstr2)&ordertype=&subscriptiontype=&day=&timeslot=\(lunchTime)&mealtype=\(chnglabl)&deliveryzone=\(custDelivery)&deliveryaddress=\(cuxtDeladd)&instruction=\(custIns)&deliverydate=27-05-2016"  // this is used to paas the data in url
            
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
            
            
            
                if let blogs = Json["success"] as? [[String: AnyObject]] {
                    for blog in blogs {
                        print(blog["orderno"])
                        print("sdagfghfhhsjfjhdgfsajhdgsjhfgshjdgfjhdsgfkjhgsdkjh")
                        if let orderno1 = blog["orderno"] as? String {
//                            if blogs.count > 0 {
//                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                                    print(blog["orderno"])
//                                    print(orderno1)
//                                    
//                                })
//                            }
                            
                            print("hgjfhjgdjhfgkshjdgfkhjsgdfkjhsgd \(orderno1)")
                        }
                    }
                
                }

                if (jjj == false){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Check Mobile Number!"
                    alertView.message = "This Mobile Number Is Already registerd"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    print("REHAN")
                    
                }
                else{
                   
   NSOperationQueue.mainQueue().addOperationWithBlock {    
   self.performSegueWithIdentifier("goToOrderPlacePage", sender: self)                    }
                    }
                    
               
                
                
            
            
        }
    
            
        task.resume()
           
        }

    }

    // place order calculation
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return TotalQuantityForDetails.count
    }
       
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomeCellForDetailsOrder
        if TotalQuantityForDetails.count > 0 {
            cell.TitaleLabel.text = ("\(TotalTitleForDetails[indexPath.row])")
            cell.QuantityLabel.text = ("\(TotalQuantityForDetails[indexPath.row])")
            
            cell.ruppesLabel.text = ("\(TotalRsForDetails[indexPath.row])")
            cell.layer.borderWidth = 0.5  // this is used to give the border in table cell
            cell.layer.borderColor = UIColor.orangeColor().CGColor // this is used to change the color of the table cell
        }
        
        return cell
        
    }
    
    
    @IBAction func codButton(sender: AnyObject) {
        if  activePlayer == 1 {
            sender.setImage(UIImage(named: "check.png"), forState: .Normal)
            activePlayer = 2
            
        }
        else{
            sender.setImage(UIImage(named: "uncheck.png"), forState: .Normal)
            activePlayer = 1
            
        }
    
    
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertView()
        alert.delegate = self
        alert.title = "Selected Item"
        orderDetails = TotalTitleForDetails[indexPath.row]
        alert.message = "You selected \(orderDetails)"
        orderIndexPath = (indexPath.row)
        orderPrice = TotalRsForDetails[indexPath.row]
        orderQnty = TotalQuantityForDetails[indexPath.row]
        print("index \(orderIndexPath)")
        print("price \(orderPrice)")
        print("qnty \(orderQnty)")
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    @IBAction func LunchDinnerButton(sender: AnyObject) {
        if (sv == true){
       slotView.hidden = false
       lunchAndDinner.hidden = false
       Lunch.hidden = false
       Dinner.hidden = false
            sv = false
        }else{
            slotView.hidden = true
            lunchAndDinner.hidden = true
            Lunch.hidden = true
            Dinner.hidden = true
          sv = true
        }

    }
    
    
    @IBAction func lunchAndDinner(sender: AnyObject) {
       
    }
    
    
    @IBAction func Lunch(sender: AnyObject) {
       
        ChangeLabel.hidden = false
        ChangeLabel.text = "Lunch"
        chnglabl = ChangeLabel.text!
        slotView.hidden = true
        
        SelectTimesSlotbutton.hidden = false
        // dinner
        DINNERselecttimeslot.hidden = true
         DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
        dinnerChangeLabel.hidden = true
       // end
    }
    
    @IBAction func Dinner(sender: AnyObject) {
      
        ChangeLabel.hidden = false
        ChangeLabel.text = "Dinner"
        chnglabl = ChangeLabel.text!
        slotView.hidden = true
        
        SelectTimesSlotbutton.hidden = true
        selecttimesslot.hidden = true
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
        dinnerChangeLabel.hidden = true
        
        // for dinner slot
        DINNERselecttimeslot.hidden = false
         DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
        // end of dinner slot
    }
    
    @IBAction func SelectTimesSlot(sender: AnyObject) {
        if (sv == false){
        SLOTVIEW.hidden = false
        SELECTTIMESOUTLETS.hidden = false
        out11to12.hidden = false
        out12to01.hidden = false
        out02to03.hidden = false
        out03to04.hidden = false
            sv = true
        }else{
            SLOTVIEW.hidden = true
            SELECTTIMESOUTLETS.hidden = true
            out11to12.hidden = true
            out12to01.hidden = true
            out02to03.hidden = true
            out03to04.hidden = true
        sv = false
        
        }
        
    }
    
    @IBAction func elevenToTwelve(sender: AnyObject) {
        selecttimesslot.hidden = false
      selecttimesslot.text = "11:00 AM-12:00 PM"
      lunchTime = selecttimesslot.text!
        
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
    }
    
    
    @IBAction func twelveToone(sender: AnyObject) {
        selecttimesslot.hidden = false
        selecttimesslot.text = "12:00 AM-01:00 PM"
        lunchTime = selecttimesslot.text!
        
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
    }
    
    
    @IBAction func OneToTwo(sender: AnyObject) {
        selecttimesslot.hidden = false
        selecttimesslot.text = "01:00 AM-02:00 PM"
        lunchTime = selecttimesslot.text!
        
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
    }
    
    
    @IBAction func TwoToThree(sender: AnyObject) {
        selecttimesslot.hidden = false
        selecttimesslot.text = "02:00 AM-03:00 PM"
        lunchTime = selecttimesslot.text!
        
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
    }
    
    
    @IBAction func threeToFour(sender: AnyObject) {
        selecttimesslot.hidden = false
        selecttimesslot.text = "03:00 AM-04:00 PM"
        lunchTime = selecttimesslot.text!
        
        SLOTVIEW.hidden = true
        SELECTTIMESOUTLETS.hidden = true
        out11to12.hidden = true
        out12to01.hidden = true
        out02to03.hidden = true
        out03to04.hidden = true
    }
    // dinner
    @IBAction func dinnerSeelectButton(sender: AnyObject) {
        if (sv == false) {
       DinnerslotView.hidden = false
            sevenToEight.hidden = false
            eightToNine.hidden = false
            NINETOten.hidden = false
            tenToEleven.hidden = false
            elevenTo12.hidden = false
        sv = true
        }else{
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
            NINETOten.hidden = true
            tenToEleven.hidden = true
            elevenTo12.hidden = true
          sv = false
        }
    }
    
    @IBAction func sevenToEightButton(sender: AnyObject) {
    dinnerChangeLabel.hidden = false
    dinnerChangeLabel.text = "07:00PM - 08:00PM"
    lunchTime = dinnerChangeLabel.text!
        
        
        
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
    
    }
    
    @IBAction func eightToNineButton(sender: AnyObject) {
        dinnerChangeLabel.hidden = false
        dinnerChangeLabel.text = "08:00PM - 09:00PM"
        lunchTime = dinnerChangeLabel.text!
        
        
        
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
 
        
    }
    
    @IBAction func NineToTenButton(sender: AnyObject) {
        dinnerChangeLabel.hidden = false
        dinnerChangeLabel.text = "09:00PM - 10:00PM"
        lunchTime = dinnerChangeLabel.text!
        
        
        
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true

    }
    
    @IBAction func TenToElevenButton(sender: AnyObject) {
        dinnerChangeLabel.hidden = false
        dinnerChangeLabel.text = "10:00PM - 11:00PM"
        lunchTime = dinnerChangeLabel.text!
        
        
        
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true
        
    }
    
    
    
    
    
    @IBAction func elevenToTweleve(sender: AnyObject) {
        dinnerChangeLabel.hidden = false
        dinnerChangeLabel.text = "11:00PM - 12:00PM"
        lunchTime = dinnerChangeLabel.text!
        
        
        
        DinnerslotView.hidden = true
        sevenToEight.hidden = true
        eightToNine.hidden = true
        NINETOten.hidden = true
        tenToEleven.hidden = true
        elevenTo12.hidden = true

    }
    
    
    
    
    //end dinner
    
    
    
    

}
