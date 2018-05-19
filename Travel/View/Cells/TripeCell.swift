//  HomeTablCell.swift
//  Travel
//
//  Created by ahmedxiio on 4/5/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos
import SwiftyJSON

class TripeCell: UITableViewCell {
    //Mark : Properities
    @IBOutlet weak var backGroundImge: UIImageViewX!
    @IBOutlet weak var dayOfTripe: UILabel!
    @IBOutlet weak var monthOfTrip: UILabel!
    @IBOutlet weak var nameOfTripe: UILabel!
    @IBOutlet weak var counterOfGoing: UILabel!
    @IBOutlet weak var locationOfTripe: UILabel!
    @IBOutlet weak var agentLogo: UIImageViewX!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet weak var tripePrice: UILabel!
    @IBOutlet weak var agent_rate: CosmosView!
    
    @IBOutlet weak var shadowView: UIViewX!
    
    func shadowViews()  {
        shadowView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 10)
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowRadius = 5
    }
    
    
    func configureCell(with event:Events){
        
        nameOfTripe.text = event.name_en!
        
        dayOfTripe.text = event.formatted_day
        
        monthOfTrip.text = event.formatted_month
        
        counterOfGoing.text = String(describing: "\(event.going!) Going")
        
        locationOfTripe.text = event.city?.name
        
        agentName.text = event.agent?.name
        
        tripePrice.text = String(describing: "\(event.price!) $")
        
        if event.agent?.agent_rate != nil {
            
            agent_rate.rating = event.agent!.agent_rate!
            
        } else {
            agent_rate.rating = 0
        }
        
        
        if let imageURL = event.imageURL {
            
            let url = URL(string: imageURL)!
            
            backGroundImge.kf.setImage(with: url)
            
        }
        if let AgentImageURL = event.agent?.AgentImageURL {
            
            let url = URL(string: AgentImageURL)!
            
            agentLogo.kf.setImage(with: url)
            
        }
        
        
    }
    
    //
    
    func configureCell2(with events:Events){
        
        nameOfTripe.text = events.name_en!
        
        dayOfTripe.text = events.formatted_day
        
        monthOfTrip.text = events.formatted_month
        
        counterOfGoing.text = String(describing: "\(events.going!) Going")
        
        tripePrice.text = String(describing: "\(events.price!) $")
        
        
        
        if let imageURL = events.imageURL {
            
            let url = URL(string: imageURL)!
            
            backGroundImge.kf.setImage(with: url)
            
        }
        
    }
    //
    
    
}
