//
//  AgentInfoVC.swift
//  Travel
//
//  Created by ahmedxiio on 4/24/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class AgentInfoVC: UIViewController {
    
    //Mark: Properities
    var agent: Agent?
    
    @IBOutlet weak var curveUI: UIViewX!
    
    @IBOutlet weak var agentLogo: UIImageView!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet  var agentRate: CosmosView!
    @IBOutlet weak var follower: UILabel!
    @IBOutlet weak var pastTrips: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var phon: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCurveUI()  
        if let agent = agent {
           config(with: agent)
        }
        
    }
    
    func config(with agent:Agent)  {
        agentName.text = agent.name
        follower.text = String(describing:"\(agent.followers_count!)")
        pastTrips.text = String(describing:"\(agent.trips_count!)")
        name.text = agent.name
        website.text = agent.website
        phon.text = agent.phone
        address.text = agent.address

        if agent.agent_rate != nil {

            agentRate.rating = agent.agent_rate!

        } else {
            agentRate.rating = 0
        }

        if let imageURL = agent.AgentImageURL {

            let url = URL(string: imageURL)!

            agentLogo.kf.setImage(with: url)

        }
    }

    func setupCurveUI()  {
        curveUI.layer.cornerRadius = 50
        curveUI.layer.maskedCorners = CACornerMask(rawValue: 12)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
