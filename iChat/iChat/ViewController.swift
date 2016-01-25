//
//  ViewController.swift
//  iChat
//
//  Created by PROTECO on 25/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
import  MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

        
        let imagePicker = UIImagePickerController()
        
        
        override func viewDidLoad() {
                super.viewDidLoad()
        
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
                imagePicker.allowsEditing = false
        }

        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
        
        
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
                self.dismissViewControllerAnimated(true, completion: nil)
                let mediaType = info[UIImagePickerControllerMediaType] as! NSString
                
                if mediaType.isEqualToString(kUTTypeImage as String) {
                        
                        // Media is an image
                        
                } else if mediaType.isEqualToString(kUTTypeMovie as String) {
                        
                        // Media is a video
                        
                }
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
                self.dismissViewControllerAnimated(true, completion: nil)
        }

}




