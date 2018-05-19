//
//  SideMenuVC.swift
//  Travel
//
//  Created by ahmedxiio on 4/8/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import FontAwesome_swift
import SideMenu

class SideMenuVC: UIViewController {
    
    //Mark : Properities
    @IBOutlet weak var tableView: UITableView!
    
    let items = SideMenuCell.instance.getMenuInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //Mark : Functions
    
    func setup()  {
        
        setupSideMenu()
        setupTableView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    func setupSideMenu()  {
        
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        SideMenuManager.default.menuAllowPushOfSameClassTwice = true
        SideMenuManager.default.menuAnimationFadeStrength = 0.2
        SideMenuManager.default.menuAnimationTransformScaleFactor = 1
        SideMenuManager.default.menuShadowOpacity = 0.7
        SideMenuManager.default.menuAnimationBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func userAcountWillApper(_ sender: UIButton) {
        
        performSegue(withIdentifier: "userAcount", sender: nil)
        
    }
}

extension SideMenuVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
extension SideMenuVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as? SideMenuCell {
            let item = items[indexPath.row]
            cell.updateViews(menuItem: item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = items[indexPath.row].menuLable
        switch name {
        case "Home":
            self.dismiss(animated: true, completion: nil)
        case "My Trips":
            performSegue(withIdentifier: "TripsSegue", sender: nil)
        case "Inbox":
            performSegue(withIdentifier: "InboxSegue", sender: nil)
        case "Alert":
            performSegue(withIdentifier: "AlertSegue", sender: nil)
        case "Invite Frinds":
            performSegue(withIdentifier: "InviteFrindsSegue", sender: nil)
        case "Settings":
            performSegue(withIdentifier: "SettingsSegue", sender: nil)
        default:
            break
        }
        
    }
    
    
}

