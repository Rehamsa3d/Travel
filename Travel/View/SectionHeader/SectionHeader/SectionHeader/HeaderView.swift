//
//  HeaderView.swift
//  Travel
//
//  Created by ahmedxiio on 4/19/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var overViewButtonUI: UIButtonX!{
        didSet {
            active(with: overViewButtonUI!)
        }
    }
    
    @IBOutlet weak var discussionButtonUI: UIButtonX!{
        didSet{
//            notActive(with: discussionButtonUI!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @IBAction func overViewAction(_ sender: Any) {
        
        active(with: overViewButtonUI)
        notActive(with: discussionButtonUI)
        
    }
    
    
    @IBAction func discussionAction(_ sender: Any) {
        
        notActive(with: overViewButtonUI)
        active(with: discussionButtonUI)
    }
    
    func active(with button:UIButtonX) {
        button.secondColor = #colorLiteral(red: 0.3478212953, green: 0.6723596454, blue: 0.6243047714, alpha: 1)
        button.firstColor = #colorLiteral(red: 0.2718865871, green: 0.1547194719, blue: 0.4257813096, alpha: 1)
        button.horizontalGradient = true
        button.cornerRadius = 22
//      button.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitleColor( #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
    }
 
    func notActive(with button:UIButtonX) {
        button.firstColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.secondColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.horizontalGradient = false
//        button.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitleColor( #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) , for: .normal)
    }
    
    func shadowColor(with button:UIButtonX)  {
        button.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func clearShadowColor(with button:UIButtonX)  {
        button.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }

}
