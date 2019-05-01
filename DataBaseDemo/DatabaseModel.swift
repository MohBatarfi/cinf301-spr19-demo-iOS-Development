//
//  DatabaseModel.swift

import Foundation
import UIKit
import FMDB

class DatabaseModel: NSObject
{
    var db = FMDatabase()
    var databasePath = String()

    override init()
    {
        super.init()
        
        let success:Bool
        let fileManager = FileManager.default
        success = fileManager.fileExists(atPath: dbPath().0)

        if !success {
            let databasePathFromApp = Bundle.main.path(forResource: "test", ofType: "db")
            do {
                try fileManager.copyItem(atPath: databasePathFromApp!, toPath: dbPath().0)
            } catch let error as NSError
            {
//                if isPrintValue
//                {
//                    //print("Error: \(error.localizedDescription)")
//                }
            }
        }
        db = FMDatabase.init(path: dbPath().0)
        db.open()

        if db.open(){
            //print("DB Open")
        }else{
           // print("DB Close")
        }
    }

    func dbPath() -> (String, URL)
    {
        let documentURl = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL.fileURL(withPath: documentURl)
        let fileurl = url.appendingPathComponent("test.db")
        let filePath = fileurl.path as String
        return (filePath, url)
    }
  
    func closeDB() -> Void
    {
        db.close()
    }
    
    deinit {
    }
    
}
//
//
//MARK: - Portfolios Table function
extension DatabaseModel
{
    func insertLocationData(Name:String, Address:String, Latitude:String, Longitude: String){
        
        let strIns = "INSERT INTO locations (Name,Address,Latitude,Longitude) VALUES (?,?,?,?)"
        //let strIns = "INSERT INTO locations (id,Name,Address,Latitude,Longitude) VALUES (?,?,?,?,?)"
        if db.executeUpdate(strIns, withArgumentsIn: [Name,Address,Latitude,Longitude])
        {
           print("Inserted at Path_\(dbPath().0)")
        }
    }
    
    // Fetch Function for get ProductsCategory From Table "ProductCategory"
    func getLocation() -> [LocationModel]
    {
        var locationData = [LocationModel]()
//        let strIns = "SELECT * FROM locations WHERE id=\(aLocationId)"
        let strIns = "SELECT * FROM locations"

        let result: FMResultSet? = db.executeQuery(strIns, withArgumentsIn: ["test"])
        if result != nil
        {
            while (result?.next())!
            {
               let resultData = LocationModel.init(dict: result?.resultDictionary! as! NSDictionary)
               locationData.append(resultData)
            }
        }
        print("Inserted at Path_\(dbPath().0)")
        return locationData
    }
}

