//
//  OdetailsCartViewController.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 19/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class OdetailsCartViewController: UIViewController {

    @IBOutlet weak var TotalPriceCart: UILabel!
   
    @IBOutlet weak var TitleProduct: UILabel!
    
    @IBOutlet weak var QuantityProduct: UILabel!
    
    @IBOutlet weak var PriceProduct: UILabel!
    
    @IBOutlet weak var QuantityTextProduct: UITextField!
    
    
    @IBOutlet weak var quantityLabelProduct: UILabel!
    
    @IBAction func UpdateProduct(sender: AnyObject) {
      let quantity = QuantityTextProduct.text
      QuantityProduct.text = quantity
      quantityLabelProduct.text = quantity
    let prs = Int(categoryprice_cart)! * Int(quantity!)!
      TotalPriceCart.text = String(prs)
      PriceProduct.text = String(prs)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TotalPriceCart.text = TPonCart
        TitleProduct.text = Title_Of_Product
        QuantityProduct.text = String(quantityOnCart)
        PriceProduct.text = TPonCart
        quantityLabelProduct.text = String(quantityOnCart)
        
        
        
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
