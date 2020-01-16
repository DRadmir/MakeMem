//
//  CollectionViewDataSourse.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

extension CollectionViewController: UICollectionViewDataSource {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return images.count
            
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
            
            let link = images[indexPath.row]
            cell.render(response: link)
            
            return cell
        }
    
}
