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
    
    
    var isScattered: Bool = false
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onLoad()
    }
    
    //MARK: Fun @ Launch
    func onLoad() {
        let letters = [lLabel, aLabel, mLabel, bLabel, dLabel, finalALabel]
        for letter in letters {
            if let unwrappedLetter = letter {
                spring(letter:unwrappedLetter)
            }
        }
    }
    
    
    //MARK: Image Anim
    func imageFadeIn() {
        //fade out
        UIView.animate(withDuration: 1, animations: {
            self.logoImage.alpha = 1
        }) { _ in
            self.logoImage.isHidden = false
        }
    }
    
    func imageFadeOut() {
        //fade in
        UIView.animate(withDuration: 2, animations: {
            self.logoImage.alpha = 0
        }) { _ in
            self.logoImage.isHidden = true
        }
    }
    
    
    //MARK: Label Anims
    
    func spring(letter: UILabel) {
        letter.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 4.0,
                       delay: 0, usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        letter.transform = .identity
        },
                       completion: nil)
    }
    
    
    
    
    
    //MARK: Toggle Anims
    @IBAction func toggleButtonTapped(_ sender: Any) {
        let letters = [lLabel, aLabel, mLabel, bLabel, dLabel, finalALabel]
        let colors = [UIColor.purple, UIColor.green, UIColor.blue, UIColor.gray, UIColor.red, UIColor.systemPink, UIColor.black]
        
        if self.isScattered == false {
            self.isScattered = true
            for letter in letters {
                if let unwrappedLetter = letter {
                    UIView.animate(withDuration: 2, animations: {
                        unwrappedLetter.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat(Int.random(in: 1...4)))
                        unwrappedLetter.transform = CGAffineTransform(translationX: 0, y: CGFloat(Int.random(in: 100...250)))

                        unwrappedLetter.backgroundColor = colors[Int.random(in: 0...6)]
                        unwrappedLetter.textColor = .white
                    }, completion: nil)
                }
            }
            
            
            imageFadeOut()
        } else if self.isScattered == true {
            self.isScattered = false
            for letter in letters {
                if let unwrappedLetter = letter {
                    UIView.animate(withDuration: 2, animations: {
                        unwrappedLetter.transform = .identity
                        unwrappedLetter.backgroundColor = nil
                        unwrappedLetter.textColor = .black
                    }, completion: nil)
                }
                imageFadeIn()
            }
        }
    }
}

