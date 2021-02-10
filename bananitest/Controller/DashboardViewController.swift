//
//  DashboardViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 25/01/21.
//

import UIKit
import DrawerMenu
class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var propertyTable: UITableView!
    @IBOutlet weak var lblName: UILabel!
    
    var strName = ""
    var currentTableView: Int!
    
    
    
    var tableItem : [[TableItems]] = [
        [TableItems(item: "Kochi", location: "Kaloor",rent: "₹13456",image: "building1.jpeg"),
         TableItems(item: "Kollam", location: "Mayyanad",rent: "₹25000",image: "building2.jpeg"),
         TableItems(item: "Thiruvananthapuram", location: "Thambanoor",rent: "₹18500",image: "building3.jpeg"),
         TableItems(item: "Kozhikode", location: "Karipur",rent: "₹21000",image: "building4.jpeg"),
         TableItems(item: "Kottayam", location: "Vykom",rent: "₹15000",image: "building5.jpeg"),
         TableItems(item: "Pathanamthitta", location: "Konni",rent: "₹10000",image: "building6.jpeg"),
         TableItems(item: "Alappuzha", location: "Cherthala",rent: "₹12400",image: "building7.jpeg"),
         TableItems(item: "Idukki", location: "Munnar",rent: "₹5000",image: "building8.jpeg")],
        [
            TableItems(item: "Mumbai", location: "Maharashtra",rent: "₹1345689",image: "plot1.jpeg"),
            TableItems(item: "Pune", location: "Mahrashtra",rent: "₹2500000",image: "plot2.jpeg"),
            TableItems(item: "Chennai", location: "Tamil Nadu",rent: "₹1850000",image: "plot3.jpeg"),
            TableItems(item: "GAYA", location: "Uttar Pradhesh",rent: "₹2100000",image: "plot4.jpeg"),
            TableItems(item: "GOA", location: "Goa",rent: "₹1500000",image: "plot5.jpeg"),
            TableItems(item: "NEW DELHI", location: "Delhi",rent: "₹1000000",image: "plot6.jpeg"),
            TableItems(item: "Amritsar", location: "Uttar Pradhesh",rent: "₹1240000",image: "plot7.jpeg"),
            TableItems(item: "Hyderabad", location: "Andhra Pradhesh",rent: "₹500000",image: "plot8.jpeg")
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTableView = 0
       // print("user name is\(strName)")
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Properties")
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: #selector(menuTapped(_:)))
        //let menu = doneItem.image = UIImage(named: "menuicon.png")
        
        let mapItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        
        navItem.leftBarButtonItem = doneItem
        navItem.rightBarButtonItem = mapItem
        
        navBar.setItems([navItem], animated: false)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "propertyDetail",
            let indexPath = propertyTable?.indexPathForSelectedRow,
            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
            destinationViewController.detail = tableItem[currentTableView][indexPath.row]
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblName.text = strName
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableItem[currentTableView].count
        //return tableItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "propertyCell") as? CustomTableViewCell
        //cell.nameLabel.text = data[currentTableView][indexPath.row]
        //cell.nameLabel.text = tableItem[currentTableView][indexPath.row].item
       // cell.designationLabel.text = tableItem[currentTableView][indexPath.row].location
       // cell.typeLabel.text = tableItem[currentTableView][indexPath.row].rent
        cell.configurateTheCell(tableItem[currentTableView][indexPath.row])
        return cell
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        if let drawer = ((UIApplication .shared).delegate as! AppDelegate).drawerMenu{
            if !(drawer.isOpenLeft) {
                drawer.open(to: .left)
            }else{
                drawer.close(to: .left)
            }
        }
    }
    @IBAction func btnLogoutTapped(_ sender: UIBarButtonItem) {
        
        APIManager.shareInstance.callingLogoutAPI(vc: self)
        
    }
    
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        propertyTable.reloadData()
        //        if sender.selectedSegmentIndex == 1
        //        {
        //
        //        }
        //        if sender.selectedSegmentIndex == 0
        //        {
        //          // lblName.text = "SALE"
        //        }
        
    }
    
}
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configurateTheCell(_ tableItem: TableItems) {
        
        profileImageView.image = UIImage(named: tableItem.image)
        nameLabel.text = tableItem.item
        designationLabel.text = tableItem.location
        typeLabel.text = tableItem.rent

    }
}

extension DashboardViewController{
    
    static func shareInstance() -> DashboardViewController {
        
        
        return UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    }
}

struct TableItems {
    
    let item : String
    let location: String
    let rent: String
    let image: String
    
    }

