//
//  city.swift
//  Travel
//
//  Created by ahmedxiio on 4/7/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
class City {
    //Mark : Properities
    var backGroundImge: String
    var dateOfTripe: String
    var nameOfTripe: String
    var counterOfGoing: String
    var locationOfTripe: String
    var agentLogo: String
    var agentName: String
    
    init(_ backGroundImge: String,dateOfTripe: String,nameOfTripe: String,counterOfGoing: String,locationOfTripe: String,agentLogo: String,agentName: String) {
        self.backGroundImge = backGroundImge
        self.dateOfTripe = dateOfTripe
        self.nameOfTripe = nameOfTripe
        self.counterOfGoing = counterOfGoing
        self.locationOfTripe = locationOfTripe
        self.agentLogo = agentLogo
        self.agentName = agentName
        
    }
    
    
}
