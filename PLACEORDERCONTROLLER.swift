//
//  PLACEORDERCONTROLLER.swift
//  Eaze Lyf
//
//  Created by Appsquad Pvt. Ltd. on 27/05/16.
//  Copyright (c) 2016 Appsquad Pvt. Ltd. All rights reserved.
//

import UIKit

class PLACEORDERCONTROLLER: UIViewController {
    
    @IBOutlet weak var OrderNumber: UILabel!
    
    @IBOutlet weak var Total: UILabel!
    
    @IBOutlet weak var Status: UILabel!
    
    @IBOutlet weak var TimesSlot: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var qtyTopLabel: UILabel!
    
    
    @IBOutlet weak var pinLabel: UILabel!
    
    
    @IBOutlet weak var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
     qtyTopLabel.text = String(quantityOnCart)
     OrderNumber.text = lunchTime
     Total.text = String(TPonCart)
     TimesSlot.text = lunchTime
     addressLabel.text = cuxtDeladd
        
        
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
