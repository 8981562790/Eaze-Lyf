//
//  OrderTableController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 28/04/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var categoryprice_cart = ""
var Index_path = 0
var alermsg = ""
var Title_Of_Product = ""
var csnId = ""
var catgId = ""
class OrderTableController: UIViewController, UITableViewDelegate,     UITableViewDataSource, UITextFieldDelegate {

    var arrayOfCategory : [CategoryDetails] = [CategoryDetails]()

    @IBOutlet var total_label: UILabel!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // download image
        
        // end of download
       // web calling for order
        let myUrl = NSURL(string: "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category/fetchallcategory")
        
        //let myUrl = NSURL(string: "http://192.168.1.54:8080/RESTfulExample/rest/category/fetchallcategory")
        
        
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        
        let postString = "pincode=\(700156)"
        // this is used to paas the data in url
        
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
            
            
            if let blogs = Json["Categories"] as? [[String: AnyObject]] {
                for blog in blogs {
                        
                let category : CategoryDetails = CategoryDetails()
                    if let cuisineid = blog["cuisineid"] as? Int {
                        category.cuisineid = cuisineid
                    }
                    if let cuid = blog["categoryid"] as? Int {
                        category.categoryid = cuid
                    }
                    if let img = blog["categoryimage"] as? String {
                        category.categoryimage = img
                    }
                    if let categoryname1 = blog["categoryname"] as? String {
                        category.categoryname = categoryname1
                    }
                    if let stk = blog["stock"] as? Int {
                        category.stock = stk
                    }
                    if let catP = blog["categoryprice"] as? Int {
                        category.categoryprice = catP
                    }
                    if let catD = blog["categorydescription"] as? String {
                        category.categorydescription = catD
                    }
                    self.arrayOfCategory.append(category)
                       
                }
                self.tableView.reloadData()
            }
        }
        
        task.resume()
        

    }
    
    
       let Title = ["VEG COMBO","NON VEG COMBO","NON VEG COMBO","VEG COMBO","VEG THALI","FISH THALI","NON VEG THALI","VEG THALI","VEG THALI","NON VEG THALI"]
    //var categorydescription = ["Steamed Rice,Daal,Veg Jhaalfrezi,Green salad","Steamed Rice,Daal,Chicken Curry,Green salad","Veg Fried Rice/Hakka Noodles,Chilli Chicken Gravy,Green Salad","Veg Fried Rice/Hakka Noodles,Veg Manchurian Gravy,Green Salad","Rice, Dal, Sabzi/Vaji,Special Sabji,Dahi & Salad ,, Rice/Roti,Sabji,Daal,Bhaja ","Rice/Roti,Sabji,Daal,Bhaja,Fish Curry, Rice, Dal, Sabzi/Vaji,Fish Curry,Dahi & Salad","Chapatis, Jeera Rice, Moong Dal, Doi Potol, Fish Curry, Salad","Chapatis, Punjabi Onion Rice, Dal Fry, Peshawari Chole, Paneer Butter Masala Paneer Makhni, Salad","Motiyan Pulao/Vegetable Khichdi,Chana Daal/ Kadhi ki Sabji,Paneer Pakoda /Besaan Bhindi, Aloo Bharta/Dahi Chane Ki Sabji","Punjabi Onion Rice, Dal Fry,Peshawari Chole, Butter Chicken"]
       var categoryprice = ["80","90","90","80","45","65","180","160","160","180"]
    var categoryimage = [UIImage(named: "Grilled1"),UIImage(named: "nonveg2"),UIImage(named: "Shahi-Ee3"),UIImage(named: "veg_combo4"),UIImage(named: "Aloo-Masala-5"),UIImage(named: "ff6"),UIImage(named: "thali7"),UIImage(named: "San8"),UIImage(named: "Chutneywale_Aloo_with_Baked_Chapatis_(4)__Tangy_Tomato_Curry_Sindhi_Style_and_Rice9"),UIImage(named:"Cotta10")]
    
    var CuisionId = ["2", "2", "3", "3", "1", "1", "1", "2", "8", "9"]
    var categoryId = ["49", "50", "55", "56", "44", "47", "42", "52", "64", "65"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayOfCategory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomeCell
        if arrayOfCategory.count > 0 {
            let category = arrayOfCategory[indexPath.row]
            cell.photo.image = categoryimage[indexPath.row]
            cell.title.text = category.categoryname! //Title[indexPath.row]
            alermsg = category.categoryname!
            //categoryprice_cart = category.categoryname! //Title[indexPath.row]
            cell.oredrDetails.text = category.categorydescription!//categorydescription[indexPath.row]
            cell.price.text =  "\(category.categoryprice!)"//
            //categoryprice_cart = "\(category.categoryprice!)" //cell.price.text! // to take price of the product
            //Index_path = (indexPath.row) // to take index path only
            //print(Index_path)
            cell.submitButton.tag = indexPath.row
           // Index_path = (cell.submitButton.tag)    // for index
           // cell.submitButton.tag = category.categoryprice!
           // categoryprice_cart = cell.submitButton.tag
        }
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertView()
        alert.delegate = self
        alert.title = "Selected Item"
        alert.message = "You selected \(Title[indexPath.row])"     // \(indexPath.row)
        Title_Of_Product = Title[indexPath.row]
        Index_path = (indexPath.row)
        categoryprice_cart = categoryprice[indexPath.row]
        csnId = CuisionId[indexPath.row]
        catgId = categoryId[indexPath.row]
        //alert.message = "\(Index_path)"
        //Index_path = (indexPath.row)
        //println("inde= \(Index_path)")
        //var title = arrayOfCategory[indexPath.row]
        //println("sdafsfsdfdsfsdfdsfdsf=\(title)"
        alert.addButtonWithTitle("OK")
        alert.show()
    }   //this is used to take index of cell when button is typed
    
          // text field adjusted when typing
    var kbHeight: CGFloat!
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(OrderTableController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(OrderTableController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
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
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
    }
    
    // override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func ViewCartButton(sender: AnyObject) {
        if (quantity == ""){
            let alertView:UIAlertView = UIAlertView()
            //alertView.title = "invalid address!"
            alertView.message = "Zero Items In Your Cart!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }else{
        self.performSegueWithIdentifier("ViewCartPage", sender: self)
        
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
