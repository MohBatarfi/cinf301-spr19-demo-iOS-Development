//
//  GetInsertedDataVCViewController.swift
//  DataBaseDemo


import UIKit

//MARK: - Custom Cell Outlets..
class CellForListingData:UITableViewCell{
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
}
class GetInsertedDataVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //Outlets...
    @IBOutlet weak var tblDataListing: UITableView!

    //variables...
    var arrLocations = [LocationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblDataListing.tableFooterView = UIView()
        self.tblDataListing.estimatedRowHeight = 150
        self.getAllInsertedData()
    }
    @IBAction func tapToBack(_ sender: UIButton) {
     self.navigationController?.popViewController(animated: true)
    }
    func getAllInsertedData()
    {
        self.arrLocations = appDelegate.databaseModel.getLocation()
        print(self.arrLocations.count)
        self.tblDataListing.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrLocations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForListingData") as! CellForListingData
        cell.lblName.text = self.arrLocations[indexPath.row].Name
        cell.lblAddress.text = self.arrLocations[indexPath.row].Address
        return cell
    }
}
