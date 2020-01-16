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
        
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        //обязательно в сториборде в пункте identify дайте название ViewController2

        vc2.image = [images[indexPath.row]]
        //тут уже на ваше усмотрение, в зависимости какая структура у вашего массива и что именно вам надо передовать.
        self.present(vc2, animated: true, completion: nil)
        
    }
    
}
