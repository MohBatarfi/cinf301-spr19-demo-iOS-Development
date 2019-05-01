//
//  ViewController.swift
//  DataBaseDemo


import UIKit

class InserDataVC: UIViewController {

    //Outlets
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtLat: UITextField!
    @IBOutlet weak var txtLong: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnGetData: UIButton!

    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.layer.cornerRadius = 5
        btnSubmit.layer.borderColor = UIColor.white.cgColor
        btnSubmit.layer.borderWidth = 1
        
        btnGetData.layer.cornerRadius = 5
        btnGetData.layer.borderColor = UIColor.white.cgColor
        btnGetData.layer.borderWidth = 1

    }

    @IBAction func tapToSubmit(_ sender: UIButton) {
        
        if txtName.text!.removeWhiteSpace() == ""
        {
            self.popupAlert(title: "Alert", message: "Please enter name", actionTitles: ["OK"], actions:[nil])
            return
        }
        else if txtAddress.text!.removeWhiteSpace() == ""
        {
            self.popupAlert(title: "Alert", message: "Please enter adress", actionTitles: ["OK"], actions:[nil])
            return
        }
        else if txtLat.text!.removeWhiteSpace() == ""
        {
            self.popupAlert(title: "Alert", message: "Please enter latitude", actionTitles: ["OK"], actions:[nil])
            return
        }
        else if txtLong.text!.removeWhiteSpace() == ""
        {
            self.popupAlert(title: "Alert", message: "Please enter longitude", actionTitles: ["OK"], actions:[nil])
            return
        }
        
        self.insertDataFromField()
    }
    @IBAction func tapToGetAllData(_ sender: UIButton) {
        let secondVc = self.storyboard?.instantiateViewController(withIdentifier: "GetInsertedDataVC") as! GetInsertedDataVC
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    func insertDataFromField()
    {
        appDelegate.databaseModel.insertLocationData(Name: txtName.text!, Address: txtAddress.text!, Latitude: txtLat.text!, Longitude: txtLong.text!)
        self.txtName.text = ""
        self.txtAddress.text = ""
        self.txtLong.text = ""
        self.txtLat.text = ""
        
        let secondVc = self.storyboard?.instantiateViewController(withIdentifier: "GetInsertedDataVC") as! GetInsertedDataVC
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
}

//MARK: - Set Globally Alert View..
extension UIViewController {
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
   }
}
