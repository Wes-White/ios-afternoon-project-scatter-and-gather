//
//  ScatteredViewController.swift
//  Scatter
//
//  Created by Wesley Ryan on 4/14/20.
//  Copyright © 2020 Wesley Ryan. All rights reserved.
//

import UIKit

class ScatteredViewController: UIViewController {

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var finalALabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    
    var toggled: Bool = false
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    
    
    
    
    func buttonFadeIn() {
        //fade out
        UIView.animate(withDuration: 2, animations: {
            self.logoImage.alpha = 1
        }) { _ in
            self.logoImage.isHidden = false
        }
    }
    
    func buttonFadeOut() {
        //fade in
        UIView.animate(withDuration: 2, animations: {
            self.logoImage.alpha = 0
        }) { _ in
            self.logoImage.isHidden = true
        }
    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        if self.toggled == false {
            self.toggled = true
            
            buttonFadeOut()
        } else if self.toggled == true {
            self.toggled = false
           
            buttonFadeIn()
        }
            
    
        
       
    }
}
