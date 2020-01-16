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

        let link = image[0]
        render(response: link)
    }
    
    @IBAction func addLabelAction(_ sender: UIButton) {
    }
    
    @IBAction func addImageButton(_ sender: UIButton) {
    }
    
    func render(response: ItemsInfo) {
        let str = response.link
        guard let url = URL(string: str) else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
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
