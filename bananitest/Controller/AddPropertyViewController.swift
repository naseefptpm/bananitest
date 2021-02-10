//
//  AddPropertyViewController.swift
//  bananitest
//
//  Created by codeteki private Ltd on 26/01/21.
//

import UIKit
import CoreML
import Vision

class AddPropertyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        imageView.image = userPickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    

}

extension AddPropertyViewController{

    static func shareInstance() -> AddPropertyViewController {

        return UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "AddPropertyViewController") as! AddPropertyViewController
    }
}
