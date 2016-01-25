//
//  ViewController.swift
//  iChat
//
//  Created by PROTECO on 25/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import  MobileCoreServices

class WelcomeController: UIViewController{

    @IBOutlet weak var profileImageButton: CircleButton!
    @IBOutlet weak var nameTextField: FlatTextField!
    
    
    
    let imagePicker = UIImagePickerController()
    var imageDelegate:CameraDelegate!
    
    let center = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureImagePicker()
        
    }

    
    
    func configureImagePicker(){
        imageDelegate = CameraDelegate(viewController: self)
        imagePicker.delegate = imageDelegate
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
        imagePicker.allowsEditing = false
        center.addObserver(self, selector: "changeImage", name: "profileImageSelected", object: nil)

    }

    @IBAction func choseImage(sender: CircleButton) {
        self.showViewController(imagePicker, sender: nil)
    }
    
    func changeImage(){
        profileImageButton.setImage(imageDelegate.image, forState:.Normal)
        profileImageButton.imageView?.contentMode = .ScaleToFill
        
    }

    
    
    @IBAction func searchNearPeople(sender: UIButton) {
        
        
        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
        
       

}


class CameraDelegate: NSObject,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    var viewController:UIViewController
    var image:UIImage = UIImage()
    let center = NSNotificationCenter.defaultCenter()
    
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
        
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        if mediaType.isEqualToString(kUTTypeImage as String) {
            image = info[UIImagePickerControllerOriginalImage] as! UIImage
            center.postNotificationName("profileImageSelected", object: nil)
            
            
        } else if mediaType.isEqualToString(kUTTypeMovie as String) {
            
            // Media is a video
            
        }

    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

class TextDelegate: NSObject,UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
}


