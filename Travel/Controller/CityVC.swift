//
//  CityVC.swift
//  Travel
//
//  Created by ahmedxiio on 4/12/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class CityVC: UIViewController , NVActivityIndicatorViewable{
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var city: City?
    
    let activityData = ActivityData()
    
    
    //    var cities = [City]()
    var events = [Events]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        setupTableView()
        handleRefresh()
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func handleRefresh() {
        //
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        cityName.text = city?.name
        
        if let imageURL = city?.imageURL {
            let url = URL(string: imageURL)!
            cityImage.kf.setImage(with: url)
        }
        
        DataService.getCityEvents(city_id: city?.id ?? 0) { (error : Error?, events : [Events]?) in
            
            if let events = events {
                self.events = events
                self.tableView.reloadData()
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                
            }
        }
        
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

// UITableViewDelegate & UITableViewDataSource
extension CityVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension CityVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TripeCell2") as? TripeCell {
            
            let event = events[indexPath.item]
            
            cell.configureCell2(with: event)
            
            return cell
        }
        return UITableViewCell()
    }
    
}

