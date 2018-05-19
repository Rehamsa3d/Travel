//
//  SideMenuCell.swift
//  Travel
//
//  Created by ahmedxiio on 4/8/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    //Mark: Properities
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var menuLable: UILabel!
    @IBOutlet weak var inboxInActiveMood: UIImageView!
    
    static let instance = SideMenuCell()
    
    let menuItem = [
        MenuItem("005-home", menuLable: "Home", inboxInActiveMood: ""),
        MenuItem("my Trip", menuLable: "My Trips", inboxInActiveMood: ""),
        MenuItem("inbox", menuLable: "Inbox", inboxInActiveMood: "77"),
        MenuItem("alaert", menuLable: "Alert", inboxInActiveMood: ""),
        MenuItem("invite friends", menuLable: "Invite Frinds", inboxInActiveMood: ""),
        MenuItem("001-settings", menuLable: "Settings", inboxInActiveMood: ""),
        MenuItem("logout", menuLable: "Logout", inboxInActiveMood: ""),
        ]
    
    //Mark: Function
    
    func updateViews(menuItem:MenuItem) {
        menuIcon.image = UIImage(named: menuItem.menuIcon)
        menuLable.text = menuItem.menuLable
        inboxInActiveMood.image = UIImage(named:menuItem.inboxInActiveMood)
    }
    func getMenuInfo() -> [MenuItem] {
        return menuItem
    }
    
}
