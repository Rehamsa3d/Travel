//
//  TripOverViewCell.swift
//  Travel
//
//  Created by ahmedxiio on 4/17/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import SwiftyJSON

class TripOverViewCell: UITableViewCell {
    
    var events = [Events]()
    var images = [String]()
    @IBOutlet weak var formatedDate: UILabel!
    @IBOutlet weak var detailedDate: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var descript: UITextView!
    
    //    var events = [Events]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "imagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imagCollectionViewCell")

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
//extension for collesctionViewCell
extension TripOverViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagCollectionViewCell", for: indexPath) as? imagCollectionViewCell {
            
            let image = images[indexPath.item]
            
            cell.configureCell(with: image)
            
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        performSegue(withIdentifier: "imgCollectionVC", sender: images[indexPath.item])
        
    }
}

//extension for configureCell
extension TripOverViewCell{
    
    func configureCell(with events:Events){
        
        formatedDate.text = events.formatted_date
        
        detailedDate.text = "\(String(describing: events.date_from!))at\(String(describing: events.time_from!))to\(String(describing: events.date_to!))at\(String(describing: events.time_to!))"
        
        cityName.text = events.city?.name
        
        weather.text = events.weather
        
        adjustUITextViewHeight(with: descript)
        
        descript.attributedText = events.description_en?.convertHtml()
        
        print(descript.text)
        events.eventimages?.forEach({ (image) in
            images.append(image)
            collectionView.reloadData()
        })
    }
}

//extension for convert Html-To-String
extension String{
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        }catch{
            return NSAttributedString()
        }
    }
}

//extension for adjust UITextViewHeight
extension TripOverViewCell{
    func adjustUITextViewHeight(with textView : UITextView){
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.sizeToFit()
        textView.isScrollEnabled = false
    }
    
}
// prepare Segue
extension TripOverViewCell {
//     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "imgCollectionVC" {
//            if let vc = segue.destination as? imgCollectionVC {
////                vc.city = sender as? City
//            }
//        }
//        if segue.identifier == "TripeInfo" {
//            if let vc = segue.destination as? TripeInfo {
//                vc.event = sender as? Events
//            }
//        }
    }

