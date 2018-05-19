//
//  UIViewController_Extentions.swift
//  sayis
//
//  Created by ahmedxiio on 3/27/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import UIKit
// UIViewController extension for navigationBar
extension UIViewController {
    func navConfigration()  {
//        let navigationBarAppearace = UINavigationBar.appearance()
        
//        navigationBarAppearace.tintColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9333333333, alpha: 1)
//        navigationBarAppearace.barTintColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9333333333, alpha: 1)
//        navigationBarAppearace.shadowImage = UIImage()
//        navigationBarAppearace.backgroundColor = UIColor.clear
//        navigationBarAppearace.isTranslucent = true
//        // change navigation item title color
//        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9333333333, alpha: 1)]
    }
}
// UIViewController extension for Alert

extension UIViewController {
    func displayAlertMessage(messageToDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
        print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    func messageToDisplay(messageToDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
}
// messageToDisplay(messageToDisplay: "Email address is not valid")

