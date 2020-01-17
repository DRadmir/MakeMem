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
    
    var currentImage: UIImage?
    var image = [ItemsInfo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = currentImage
        
    }
    
    @IBAction func addLabelAction(_ sender: UIButton) {
    }
    
    @IBAction func addImageButton(_ sender: UIButton) {
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
