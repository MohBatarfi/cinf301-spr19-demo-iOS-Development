
//
//  LocationModel.swift
//  WebApps_Demo
//
//  Created by Mohammed Batarfi on 4/29/19.
//  Copyright © 2019 Mohammed Batarfi. All rights reserved.
//

import UIKit

class LocationModel: NSObject {
    
    var id: String = String()
    var Name: String = String()
    var Address: String = String()
    var Latitude: String = String()
    var Longitude: String = String()
    
    override init(){
        
    }
    
    init(dict : NSDictionary){
        self.id = dict.getString(key: "id")
        self.Name = dict.getString(key: "name")
        self.Address = dict.getString(key: "address")
        self.Latitude = dict.getString(key: "latitude")
        self.Longitude = dict.getString(key: "longitude")
    }
}

//NSDictionary Contains Value
extension NSDictionary {
    
    //MARK: - Get String From Dictionary
    func getString(key:String) -> String {
        
        if let value = self[key] {
            
            let string = NSString.init(format: "%@", value as! CVarArg) as String
            if (string.lowercased() == "null" || string.lowercased() == "nil") {
                return ""
            }
            return string.removeWhiteSpace()
        }
        return ""
  }
}
//MARK: - String Extension
extension String {
    
    //Remove white space in string
    func removeWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}
