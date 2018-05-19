//
//  ViewController.swift
//  Travel
//
//  Created by ahmedxiio on 4/5/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import SideMenu
import DropDown
import NVActivityIndicatorView

class HomeVC: UIViewController , NVActivityIndicatorViewable {
    //Mark: Properities
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var filterationButton: UIButton!
    
    let activityData = ActivityData()
    
    
    
    let dropDown = DropDown()
    
    var cities = [City]()
    var events = [Events]()
    
    var currentEvents = [Events]() //UpdateTableView
    
    
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    func setup() {
        
        setupIndicator()
        
        setupDropDown()
        
        setupColletionView()
        
        setupTableView()
        
        handleRefresh()
        
        filteration()
        
        setupSearchBar()
    }
    
    func setupColletionView() {
        colletionView.delegate = self
        colletionView.dataSource = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func setupSearchBar() {
        searchBar.delegate = self
    }
    func setupIndicator()  {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        NVActivityIndicatorView.DEFAULT_COLOR = #colorLiteral(red: 0.3724559295, green: 0.1120592949, blue: 0.4955528846, alpha: 1)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)

    }
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchBar.text?.isEmpty ?? true
    }
    func isFiltering() -> Bool {
        return !searchBarIsEmpty()
    }
    
    private func handleRefresh() {
        
        DataService.getCity { (error : Error?, cities : [City]?) in
            
            if let cities = cities {
                
                self.cities = cities
                self.colletionView.reloadData()

            }
        }
        DataService.getEvents { (error : Error?, events : [Events]?) in
            
            if let events = events {
                self.events = events
                self.tableView.reloadData()
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()

            }
        }
        
    }
    
    func setupDropDown()  {
        
        dropDown.anchorView = view 
        
        dropDown.dataSource = ["Near Me ", "price ", "latest "]
        
        DropDown.appearance().textColor = #colorLiteral(red: 0.2945458198, green: 0.07250394129, blue: 0.4457850302, alpha: 1)
        
        DropDown.appearance().textFont = UIFont.systemFont(ofSize: 19)
        
        DropDown.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        DropDown.appearance().selectionBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        DropDown.appearance().cellHeight = 60
        
        dropDown.direction = .top
        
    }
    
    func filteration()  {
        // Action triggered on selection
   
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.filterationButton.setTitle(self.dropDown.selectedItem, for: .normal )
            self.events.removeAll()
            self.tableView.reloadData()
            self.startAnimating()
            var filterType = "1"

            if self.dropDown.selectedItem == "Near Me " {
                filterType = "1"
            }else if self.dropDown.selectedItem == "price " {
                filterType = "2"

            }else if self.dropDown.selectedItem == "latest " {
                filterType = "3"

            }

            
            DataService.getFilteration(filter : filterType,completion: { (error : Error?, events : [Events]?) in
                
                if  error != nil {
                    print(error?.localizedDescription)
                    // alert
                    
                }
                if let events = events {
                    self.events = events
               
                }
                self.stopAnimating()
                self.tableView.reloadData()
                
            })

        }

    }
    
    
    @IBAction func filterationDropDown(_ sender: Any) {
        
        dropDown.show()
        filteration()

    }
    
    @IBAction func showMyTripsVC(_ sender: Any) {
        performSegue(withIdentifier: "MyTripsVC", sender: nil)
    }
}

// UITableViewDelegate & UITableViewDataSource
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return currentEvents.count
        }
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TripeCell") as? TripeCell {
            if isFiltering(){
                let event = currentEvents[indexPath.item]
                cell.configureCell(with: event)
                return cell
            }
            let event = events[indexPath.item]
            cell.configureCell(with: event)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        performSegue(withIdentifier: "TripeInfo", sender: events[indexPath.row])
    }

}

// UICollectionViewDelegate & UICollectionViewDataSource

extension HomeVC: UICollectionViewDelegate {}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as? CityCell {
            
            let city = cities[indexPath.item]
            
            cell.configureCell(with: city)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromHomeViewControllerToCityViewControolerSegue", sender: cities[indexPath.item])
    }
  
    }


extension HomeVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty
            else{
                
                currentEvents = events
                
                tableView.reloadData()
                return
                
        }
        
        currentEvents = events.filter({ (event) -> Bool in
            return (event.name_en?.lowercased().contains(searchText.lowercased()))!
        })
            tableView.reloadData()

//        if currentEvents == nil {
//            print("no such result ")
//        }else{
//            tableView.reloadData()
//
//        }
    }
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//        searchBar.resignFirstResponder()
//        return true
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
////        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
//
//    }
    
}

// prepare Segue
extension HomeVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromHomeViewControllerToCityViewControolerSegue" {
            if let vc = segue.destination as? CityVC {
                vc.city = sender as? City
            }
        }
        if segue.identifier == "TripeInfo" {
            if let vc = segue.destination as? TripeInfo {
                vc.event = sender as? Events
            }
        }
    }
}

