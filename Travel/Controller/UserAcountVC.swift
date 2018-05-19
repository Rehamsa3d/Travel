//
//  UserAcountVC.swift
//  Travel
//
//  Created by ahmedxiio on 4/12/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class UserAcountVC: UIViewController {
    
    
    //Mark: Properties
    @IBOutlet weak var roundView: UIViewX!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var followerNumber: UILabel!
    @IBOutlet weak var favoritesNumber: UILabel!
    @IBOutlet weak var tripsNumber: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phon: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var password: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupData()
        roundViewFunc()
    }
    func roundViewFunc(){
        roundView.layer.cornerRadius = 50
        roundView.layer.maskedCorners = CACornerMask(rawValue: 12)
    }
    
    func setupData() {
        userName.text = "User Name"
        //        userImage.image = UIImage(named:"")
        followerNumber.text = "333"
        favoritesNumber.text = "32"
        tripsNumber.text = "2"
        name.text = "User Name Profile"
        email.text = "User@gmail.com"
        phon.text = "0129999877"
        gender.text = "mail"
        password.text = "*********"
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editeAction(_ sender: UIButton) {
    }
    
    
    
    
}
