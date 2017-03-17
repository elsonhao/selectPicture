//
//  ViewController.swift
//  selectPicture
//
//  Created by 黃毓皓 on 2017/3/17.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       myImage.isUserInteractionEnabled = true
    myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPickerMenu)))
    }
    
    func showPickerMenu(){
        let alertcontroller = UIAlertController(title: "選擇哪種模式", message: "可拍照或從圖庫取用", preferredStyle: .actionSheet)
        let alertaction = UIAlertAction(title: "圖庫取用", style: .default) { (action) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        let alertaction2 = UIAlertAction(title: "拍照", style: .default) { (action) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertcontroller.addAction(alertaction)
        alertcontroller.addAction(alertaction2)
        present(alertcontroller, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        myImage.image = image
        self.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

