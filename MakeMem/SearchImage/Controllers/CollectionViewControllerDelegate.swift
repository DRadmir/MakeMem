//
//  CollectionViewControllerDelegate.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 16.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit

extension CollectionViewController: UICollectionViewDelegate {
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let editorVC = storyboard?.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        
        let temp = self.collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        let tempImage = temp.imageView.image
        
        editorVC.currentImage = tempImage
        
        self.present(editorVC, animated: true, completion: nil)
    }
    
}
