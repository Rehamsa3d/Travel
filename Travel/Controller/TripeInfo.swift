//
//  TripeInfo.swift
//  Travel
//
//  Created by ahmedxiio on 4/17/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Cosmos

enum tripType {
    case overView
    case descution
}

class TripeInfo: UIViewController {
    
    var header:HeaderView?

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var tableHeader: UIView!
    var tripType:tripType = .overView
    
    
//    @IBOutlet weak var curve: UIViewX!

    @IBOutlet var cityImage: UIImageViewX!
    @IBOutlet var tripName: UILabel!
    @IBOutlet var going: UILabel!
    @IBOutlet var day: UILabel!
    @IBOutlet var month: UILabel!
//    @IBOutlet var agentLogo: UIImageView!
    @IBOutlet var agentName: UILabel!
    @IBOutlet var agentRate: CosmosView!
    @IBOutlet var price: UILabel!
    
    var events = [Events]()
    var event: Events?
//    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
   
    func setup()  {
        setupTableView()
        handleRefresh()
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TripOverViewCell", bundle: nil), forCellReuseIdentifier: "TripOverViewCell")
        tableView.register(UINib(nibName: "TripDiscussionCell", bundle: nil), forCellReuseIdentifier: "TripDiscussionCell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(UINib(nibName: "SectionFooter", bundle: nil),forHeaderFooterViewReuseIdentifier:"SectionFooter")

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight =  900

    }

    func setupCurveUI()  {
        
       /* let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let curveWidth = screenWidth*3
        let curveHeight = screenHeight

        curve.frame = CGRect(x: -curveHeight/4, y: -curveHeight+250, width: curveHeight , height: curveHeight)
        curve.cornerRadius = curveHeight/2
        cityImage.frame = CGRect(x: 0, y: 0, width: curveHeight, height: curveHeight)
        cityImage.cornerRadius = (screenWidth+screenHeight)/2 */

}
    private func handleRefresh() {
            tripName.text = event?.name_en
        
            going.text = String(describing: "\(event?.going ?? 0) Going")
            
            day.text = event?.formatted_day
            
            month.text = event?.formatted_month
            
            
            agentName.text = event?.agent?.name
            
            price.text = String(describing: "\(event?.price ?? 0) $")
            
            if event?.agent?.agent_rate != nil {
                
                agentRate.rating = (event?.agent!.agent_rate!)!
                
            } else {
                agentRate.rating = 0
            }
            
            
        if let imageURL = event?.imageURL {
                
                let url = URL(string: imageURL)!
                
                cityImage.kf.setImage(with: url)
                
            }

    }
        
    //Mark: Actions
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
    @IBAction func performAgentVC(_ sender: Any) {
        
        performSegue(withIdentifier: "AgentInfoVC", sender: event?.agent!)

    }
    

}



extension TripeInfo:UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView {
            cell.overViewButtonUI.addTarget(self, action: #selector(tripViewOrDiscution), for: .touchUpInside)
            cell.discussionButtonUI.addTarget(self, action: #selector(tripViewOrDiscution), for: .touchUpInside)
            
                return cell
        }
       return UITableViewHeaderFooterView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        if let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionFooter") as? SectionFooter {
    
            return cell
        }
       return UITableViewHeaderFooterView()


    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tripType == .overView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripOverViewCell", for: indexPath) as? TripOverViewCell
            cell?.configureCell(with: event!)
                    return cell!
        }else{
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TripDiscussionCell", for: indexPath) as? TripDiscussionCell
        return cell2!
        }
    }
    


   @objc func tripViewOrDiscution() {
        tripType = tripType == .descution ? .overView : .descution
        tableView.reloadData()
    }

}

// prepare Segue
extension TripeInfo {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AgentInfoVC" {
            if let vc = segue.destination as? AgentInfoVC {
                vc.agent = sender as? Agent
            }
        }
    }
}



