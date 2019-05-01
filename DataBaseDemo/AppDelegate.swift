//
//  AppDelegate.swift
//  DataBaseDemo
//
import UIKit
import FMDB

let appDelegate = UIApplication.shared.delegate as! AppDelegate
var isPrintValue: Bool = true

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var db = FMDatabase()
    let databaseModel = DatabaseModel()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

//MARK:- Database Methods
extension AppDelegate
{
    // Create DataBase/Exist DataBase
    func createAndCheckDatabase()
    {
        let documentURl = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL.fileURL(withPath: documentURl)
        let fileurl = url.appendingPathComponent("test.db")
        let filePath = fileurl.path as String
        
        if isPrintValue{
            print("Db Path:-",filePath)
        }
        
        let success:Bool
        let fileManager = FileManager.default
        success = fileManager.fileExists(atPath: filePath as String)
        
        if success {
            //return
        }else{
            
            let databasePathFromApp = Bundle.main.path(forResource: "test", ofType: "db")
            do {
                try fileManager.copyItem(atPath: databasePathFromApp!, toPath: filePath)
            } catch let error as NSError
            {
                if isPrintValue{
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        if db.open() == false
        {
            print("Could not open db.")
        }
    }
}
