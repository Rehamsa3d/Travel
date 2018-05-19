//
//  MenuItem.swift
//  Travel
//
//  Created by ahmedxiio on 4/8/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
class MenuItem {
    //Mark : Properities
    var menuIcon: String
    var menuLable: String
    var inboxInActiveMood: String
    
    
    init(_ menuIcon: String,menuLable: String,inboxInActiveMood:String) {
        self.menuIcon = menuIcon
        self.menuLable = menuLable
        self.inboxInActiveMood = inboxInActiveMood
    }
}
