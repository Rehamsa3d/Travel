//
//  CityCell.swift
//  Travel
//
//  Created by ahmedxiio on 4/7/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Kingfisher

class CityCell: UICollectionViewCell {
    
    //Mark : Properities
    @IBOutlet weak var cityImage: UIImageViewX!
    @IBOutlet weak var cityName: UILabel!
    
    //Mark: Function
    func configureCell(with city: City){
        
        cityName.text = city.name
        
        if let imageURL = city.imageURL {
            
            let url = URL(string: imageURL)!
            cityImage.kf.setImage(with: url)
        }
    }
    
}


