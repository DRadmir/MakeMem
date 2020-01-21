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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    var currentImage: UIImage?
    var image = [ItemsInfo]()
    var labelArray = [UILabel]()
    var editingLabel = false {
        didSet {
            if self.editingLabel {
                self.fontSizeSlider.isHidden = false
            } else {
                self.fontSizeSlider.isHidden = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = currentImage
        saveButton.isUserInteractionEnabled = false
        textField?.delegate = self
        textField?.isHidden = true
        fontSizeSlider.isHidden = true

    }
    
    @IBAction func addLabelButtonAction(_ sender: UIButton) {
        editingLabel = true
        textField?.isHidden = false
        textField?.clearsOnBeginEditing = true
        textField?.becomeFirstResponder()
    }
    
    @IBAction func addImageButtonAction(_ sender: UIButton) {
        self.chooseImagePicker(source: .photoLibrary)
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        if imageView.image != nil {
            
            self.saveButton.isUserInteractionEnabled = true
            
            guard let image = currentImage else { return }
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
        }
    }
    
    @IBAction func fontSizeSliderAction(_ sender: UISlider) {

    }
    
    func createLabel() {
        let label = UILabel()
        label.text = textField.text
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.frame = CGRect(origin: self.view.center, size: CGSize(width: view.frame.width - 50, height: label.frame.height))
        label.sizeToFit()
        self.labelArray.append(label)
        self.view.addSubview(label)
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

extension EditorViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField.text != nil {
            createLabel()

            textField.isHidden = true
            textField.resignFirstResponder()
            
            editingLabel = false
            
            tapGestureSetting()
            panGestureSetting()
        }
        return true
    }
}

