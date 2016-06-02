//
//  CustomeCellForDetailsOrder.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 20/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit
var detailsQuantity = ""
var finalPrice = 0
var TPonCart2 = 0
var oldPrice = 0
var oldqnty = 0
var topqntylabel = 0

var TPonCart3 = 0
var topqntylabel3 = 0
var oldPrice3 = 0
var oldqnty3 = 0

class CustomeCellForDetailsOrder: UITableViewCell {

    @IBOutlet weak var TitaleLabel: UILabel!
    
    
    @IBOutlet weak var QuantityLabel: UILabel!
    
    @IBOutlet weak var ruppesLabel: UILabel!
    
    @IBOutlet weak var customerText: UITextField!
    
    @IBOutlet weak var qtyRealLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    @IBAction func updateButton(sender: AnyObject) {
        
        detailsQuantity = customerText.text!
        _ = (orderPrice)
        if (customerText.text == ""){
            let alertView:UIAlertView = UIAlertView()
            //alertView.title = "invalid address!"
            alertView.message = "Please Select Your Order And Type The Quantity!!"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }else{
//            if (orderQnty != ""){
//            //print(" index poath = \(orderIndexPath)")
//            oldPrice = (TPonCart).int() - ((orderQnty)?.int() * (orderPrice)?.int())
//            //print(oldPrice)
//            oldqnty = quantityOnCart - (orderQnty).Int()
//            //print(oldqnty)
//                
//            TPonCart2 = (oldPrice + (detailsQuantity).int() * (checkprice)?.int())
//            QuantityLabel.text = detailsQuantity
//            priceLabel.text = String(TPonCart2)
//            TPonCart = String(TPonCart2)
//            topqntylabel = oldqnty + (detailsQuantity).int()
//            qtyRealLabel.text = String(topqntylabel)
//                
//
//            }
            
            //start
            // end
           
        }
        
        
    
        
           }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        qtyRealLabel.text = ("\(quantityOnCart)")
        priceLabel.text = TPonCart
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
