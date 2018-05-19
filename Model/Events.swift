//
//  Tripe.swift
//  Travel
//
//  Created by ahmedxiio on 4/7/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import SwiftyJSON
class Events: NSObject {
    //Mark : Properities
    
    var id:Int?
    var imageURL: String?
    var name_en: String?
    var description_en:String?
    var date_to:String?
    var time_from:String?
    var date_from:String?
    var time_to:String?
    var weather:String?
    var types:String?
    var city_id:Int?
    var agent_id :Int?
    var created_at :String?
    var updated_at :String?
    var is_favorited :Int?
    var event_images :[JSON]?
    var formatted_day: String?
    var formatted_month: String?
    var formatted_date:String?
    var going: Int?
    var city:City?
    var agent:Agent?
    var price: Double?
    var eventimages:[String]?
    //    var agent_rate : Double?
    
    init(with json: JSON) {
        
        self.id = json["id"].int
        
        self.name_en = json["name_en"].string
        
        self.description_en = json["description_en"].string
        
        self.date_to = json["date_to"].string
        
        self.time_from = json["time_from"].string
        
        self.date_from = json["date_from"].string
        
        self.time_to = json["time_to"].string
        
        self.weather = json["weather"].string
        
        self.types = json["types"].string
        
        self.city_id = json["city_id"].int
        
        self.agent_id = json["agent_id"].int
        
        self.created_at = json["created_at"].string
        
        self.updated_at = json["updated_at"].string
        
        let city = City(with: (json["city"]))
        self.city = city
        
        let agent = Agent(with: json["agent_info"])
        self.agent = agent
        
        self.formatted_day = json["formatted_day"].string
        
        self.formatted_month = json["formatted_month"].string
        
        self.formatted_date = json["formatted_date"].string
        
        self.going = json["going_number"].int
        
        //        self.agent_rate = json["agent_rate"].double
        
        self.price = json["price"].double
        
//        if let event_images = json["event_images"].array{
//
//            self.event_images =  event_images
//
//        }
        
        if let image = json["image"].string {
            
            self.imageURL = baseUrl + image
        }
        
        
        let images = json["event_images"].arrayObject as! [String]
        self.eventimages = images.map{
            return baseUrl + $0
        }

 
    }
    var favoritesEvent : Int? {
        get {
            return self.is_favorited
        }
        set{
            is_favorited = newValue
        }
    }
}




/*
 {
 "id": 31,
 "name_ar": "trip to Seoul",
 "name_en": "trip to Seoul",
 "description_ar": "",
 "description_en": "",
 "date_to": "2018-03-21",
 "time_from": "10:00:00",
 "time_to": "22:00:00",
 "weather": "sunny",
 "image": "storage/H0bDQW7JcyjhymJaXBnNWkna2Fqj1V9zDMC2tRSa.jpeg",
 "date_from": "2018-03-12",
 "price": 50000,
 "types": "1,2,3",
 "city_id": 11,
 "agent_id": 4,
 "created_at": "2018-03-28 09:54:19",
 "updated_at": "2018-03-28 09:54:19",
 "formatted_day": "12",
 "formatted_month": "March",
 "formatted_date": "March 12 - March 21",
 "event_images": [
 "storage/7RATzOrwowYFbhUWOoGLZNVGUYweo0lazYafCoJB.jpeg",
 "storage/yP6wfC938C23HRI6zzUW4eh14NoHvX46WLh3Ac99.jpeg",
 "storage/JIPzchBsJwjlFRYa08o2Z3ejtorNHxTmlir3xcXi.jpeg",
 "storage/ekH9YPRCJsjPhjZlLRWv73fpXK5IY0XT2M4xkElf.jpeg",
 "storage/MtzpEbtvymTVaxVNocfDQ3GEFvXx3aTz97dC6wVg.jpeg"
 ],
 "is_favorited": 0,
 "avg_rate": "3.0000",
 "agent_info": {
 "id": 4,
 "name": "hazoooom",
 "email": "hazem1@hazem.com",
 "phone": "01025880800",
 "activation": 1,
 "type": 2,
 "image": "storage/JtMh9gHSByrkIvJjjOUmxU6WhiCOXBFEs2vraFWI.jpeg",
 "cover": "img/default-cover-profile.jpg",
 "website": "https://www.hazem.com",
 "address": "3, st rashdan, dokki, cairo",
 "gender": "2",
 "social_id": null,
 "social_type": null,
 "reset_password_code": null,
 "api_token": "f4863d80397be4029a2ad51a8e7ce783",
 "android_token": null,
 "ios_token": null,
 "created_at": "2018-03-03 13:59:12",
 "updated_at": "2018-04-04 15:28:41",
 "trips_count": 9,
 "followers_count": 7,
 "agent_rate": 2.32592222222
 },
 "going_number": 19,
 "city": {
 "id": 11,
 "name_ar": "سيول",
 "name_en": "Seoul",
 "image": "storage/Y8DuuDLPvN7GZqvvM5UuK6Ay3W02mBmdsCgleWop.jpeg",
 "status": 1,
 "created_at": "2018-03-28 09:22:17",
 "updated_at": "2018-03-28 09:23:25"
 },
 "agent": {
 "id": 4,
 "name": "hazoooom",
 "email": "hazem1@hazem.com",
 "phone": "01025880800",
 "activation": 1,
 "type": 2,
 "image": "storage/JtMh9gHSByrkIvJjjOUmxU6WhiCOXBFEs2vraFWI.jpeg",
 "cover": "img/default-cover-profile.jpg",
 "website": "https://www.hazem.com",
 "address": "3, st rashdan, dokki, cairo",
 "gender": "2",
 "social_id": null,
 "social_type": null,
 "reset_password_code": null,
 "api_token": "f4863d80397be4029a2ad51a8e7ce783",
 "android_token": null,
 "ios_token": null,
 "created_at": "2018-03-03 13:59:12",
 "updated_at": "2018-04-04 15:28:41",
 "trips_count": 9,
 "followers_count": 7,
 "agent_rate": 2.32592222222
 }
 }
 */
