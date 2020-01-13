//
//  CollectionViewCell.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    private var task: URLSessionDataTask?
    
    func render(response: ItemsInfo) {
        let str = response.link
        guard let url = URL(string: str) else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }

}
