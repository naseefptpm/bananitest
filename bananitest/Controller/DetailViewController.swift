//
//  DetailViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 06/02/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!


    var detail: TableItems?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let detail = detail {
            //navigationItem.title = recipe.name
            imageView.image = UIImage(named: detail.image)
            nameLabel.text = detail.item
            locationLabel.text = detail.location
            priceLabel.text = detail.rent
           // prepTime.text = "Prep Time: " + recipe.prepTime
        }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


