//
//  CustomeCell.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 02/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
// for oreder details Page
var TotalPriseForDetails = [Int]()
var TotalTitleForDetails = [String]()
var TotalQuantityForDetails = [String]()
var TotalRsForDetails = [String]()
var CusionId = [String]()
var CATID = [String]()
var ccccid = ""
var cccctgid = ""
var combination1 = ""
var combination = [String]()
var Comibinationstr2 = ""
// end of order details page

var quantity = ""
var amount1 = 0
var quantity1 = 0
var addQuantity = 0

var amount2 = 0
var quantity2 = 0
var totalAmount = 0

var amount3 = 0
var quantity3 = 0
var addQuantity3 = 0
var totalAmount3 = 0

var amount4 = 0
var quantity4 = 0
var addQuantity4 = 0
var totalAmount4 = 0

var amount5 = 0
var quantity5 = 0
var addQuantity5 = 0
var totalAmount5 = 0

var amount6 = 0
var quantity6 = 0
var addQuantity6 = 0
var totalAmount6 = 0

var amount7 = 0
var quantity7 = 0
var addQuantity7 = 0
var totalAmount7 = 0

var amount8 = 0
var quantity8 = 0
var addQuantity8 = 0
var totalAmount8 = 0

var amount9 = 0
var quantity9 = 0
var addQuantity9 = 0
var totalAmount9 = 0

var amount10 = 0
var quantity10 = 0
var addQuantity10 = 0
var totalAmount10 = 0

// for cart details page
var TPonCart = ""
var quantityOnCart = 0



class CustomeCell: UITableViewCell {
    var tapBlock: dispatch_block_t?
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var oredrDetails: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet var quantityText: UITextField!
    
    @IBOutlet weak var checklabel: UILabel!
    
    @IBOutlet weak var total_cart: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    
    
    @IBAction func submit(sender: AnyObject) {
        let ip = (Index_path)
        let cc = (categoryprice_cart)
        quantity = quantityText.text!
        
        if (ip == 0 && cc == ""){
            let alertView:UIAlertView = UIAlertView()
            //alertView.title = "Invalid Mobile Number!"
            alertView.message = "Please Select Your Order Click On Itom !"
            alertView.delegate = self
            alertView.addButtonWithTitle("NO")
            alertView.show()

        
        }else{
        
        if (quantity != "" && Index_path == 0){
            quantity1 = Int(quantity)! + quantity2 + quantity3 + quantity4 + quantity5 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(quantity1)
            amount1 = amount4 + amount3 + amount2 + Int(categoryprice_cart)! * Int(quantity) + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(amount1)
             TPonCart = String(amount1)
            quantityOnCart = quantity1
        }/*else{
         print("Please Select And Enter Quantity Of Product")   
        }*/
        else if (quantity != "" && Index_path == 1){
            quantity2 = Int(quantity)!
            addQuantity = quantity2 + quantity1 + quantity3 + quantity4 + quantity5 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity)
            amount2 = (categoryprice_cart).Int()! * quantity2
            totalAmount = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount)
            TPonCart = String(totalAmount)
            quantityOnCart = addQuantity
        }/*else{
        print("Please Select And Enter Quantity Of Product")
        }*/
        else if (quantity != "" && Index_path == 2){
            quantity3 = (quantity).Int()!
            addQuantity3 = quantity4 + quantity3 + quantity2 + quantity1 + quantity5 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity3)
            amount3 = (categoryprice_cart).Int()! * quantity3
            totalAmount3 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount3)
            TPonCart = String(totalAmount3)
            quantityOnCart = addQuantity3
        }/*else{
        print("Please Select And Enter Quantity Of Product")
        }*/
        else if (quantity != "" && Index_path == 3){
            quantity4 = (quantity).Int()!
            addQuantity4 = quantity4 + quantity3 + quantity2 + quantity1 + quantity5 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity4)
            amount4 = (categoryprice_cart).Int()! * quantity4
            totalAmount4 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount4)
           TPonCart = String(totalAmount4)
            quantityOnCart = addQuantity4
            }
//        else{
//            print("Please Select And Enter Quantity Of Product")
//        }
        else if (quantity != "" && Index_path == 4){
            quantity5 = (quantity).Int()!
            addQuantity5 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity5)
            amount5 = (categoryprice_cart).Int()! * quantity4
            totalAmount5 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount5)
            TPonCart = String(totalAmount5)
            quantityOnCart = addQuantity5
        }
//        else{
//            print("Please Select And Enter Quantity Of Product")
//        }
        else if (quantity != "" && Index_path == 5){
            quantity6 = (quantity).Int()!
            addQuantity6 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity6)
            amount6 = (categoryprice_cart).Int()! * quantity6
            totalAmount6 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount6)
            TPonCart = String(totalAmount6)
            quantityOnCart = addQuantity6
        }/*else{
            print("Please Select And Enter Quantity Of Product")
        }*/
        else if (quantity != "" && Index_path == 6){
            quantity7 = (quantity).Int()!
            addQuantity7 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity7)
            amount7 = (categoryprice_cart).Int()! * quantity7
            totalAmount7 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount7)
            TPonCart = String(totalAmount7)
            quantityOnCart = addQuantity7
        }/*else{
            print("Please Select And Enter Quantity Of Product")
        }*/
        else if (quantity != "" && Index_path == 7){
            quantity8 = (quantity).Int()!
            addQuantity8 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity8)
            amount8 = (categoryprice_cart).Int()! * quantity8
            totalAmount8 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount8)
            TPonCart = String(totalAmount8)
            quantityOnCart = addQuantity8
        }/*else{
            print("Please Select And Enter Quantity Of Product")
        }*/
        else if (quantity != "" && Index_path == 8){
            quantity9 = (quantity).Int()!
            addQuantity9 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
            checklabel.text = String(addQuantity9)
            amount9 = (categoryprice_cart).Int()! * quantity9
            totalAmount9 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
            total_cart.text = String(totalAmount9)
            TPonCart = String(totalAmount9)
            quantityOnCart = addQuantity9
        }/*else{
            print("Please Select And Enter Quantity Of Product")
        }*/
    else if (quantity != "" && Index_path == 9){
    quantity10 = (quantity).Int()!
    addQuantity10 = quantity5 + quantity4 + quantity3 + quantity2 + quantity1 + quantity6 + quantity7 + quantity8 + quantity9 + quantity10
    checklabel.text = String(addQuantity10)
    amount10 = (categoryprice_cart).Int()! * quantity10
    totalAmount10 = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
    total_cart.text = String(totalAmount10)
        TPonCart = String(totalAmount10)
        quantityOnCart = addQuantity10
    }else{
            let alertView:UIAlertView = UIAlertView()
            //alertView.title = "Invalid Mobile Number!"
            alertView.message = "Quantity Required !"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
    }
            var i = 0
            if(i == 0){
                //CusionId.append(csnId)
               //CATID.append(catgId)
                TotalQuantityForDetails.append(quantity)
                combination.append(csnId+"$"+catgId+"$"+quantity+"$"+categoryprice_cart)
                TotalTitleForDetails.append(Title_Of_Product)
                TotalRsForDetails.append(categoryprice_cart)
                
                print(TotalQuantityForDetails)
                print(TotalTitleForDetails)
                print(TotalRsForDetails)
                
                //print(combination)
                //print(combination.count)
                
              //  var cnt = combination.count
                var str2:String = ""
                for i = 0; i < combination.count; i += 1 {
                    if(str2 == ""){
                        str2 = combination[i]
                    }else{
                        str2 = str2 + "," + combination[i]
                    }
                }
                Comibinationstr2 = str2
                print(str2)
                
//                var strcon = ""
//                for (var i = 0; i < combination.count; i++){
//                strcon = strcon + combination[i]
//                
//                }
//                print(strcon)
//            Comibinationstr2 = strcon
            
            
            
            
            
            
            }
            
        
            
        }
    }



    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
