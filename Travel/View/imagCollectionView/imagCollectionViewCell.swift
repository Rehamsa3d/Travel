//
//  imagCollectionViewCell.swift
//  Travel
//
//  Created by ahmedxiio on 4/18/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Kingfisher
class imagCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImage: UIImageView!
    var event: Events?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(with image:String){
        
            let url = URL(string: image)
            cityImage.kf.indicatorType = .activity
            cityImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            
    }
}
