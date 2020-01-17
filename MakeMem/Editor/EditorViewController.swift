//
//  EditorViewController.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 16.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit
import Kingfisher

class EditorViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addLabelButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var currentImage: UIImage?
    var image = [ItemsInfo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isUserInteractionEnabled = false
        
        imageView.image = currentImage
        
    }
    
    @IBAction func addLabelButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func addImageButtonAction(_ sender: UIButton) {
        
        self.chooseImagePicker(source: .photoLibrary)
        
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        if imageView.image != nil {
            
            self.saveButton.isUserInteractionEnabled = true
            
            guard let image = currentImage else { return }
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
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

extension EditorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.editedImage] as? UIImage
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
        
    }
    
}
