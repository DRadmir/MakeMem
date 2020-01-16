//
//  CollectionViewController.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit


class CollectionViewController: UIViewController, UIScrollViewDelegate {
    
    var images = [ItemsInfo]()
    var fetching = false
    var currentPage = 0
    var startIndex = 1
    var queryText = ""
    
//    lazy var searchManager = SearchManager(engineID: "014947724660651884946:uat8snwrscy",
//                                           apiKey:"AIzaSyA8r29n6je1GvS0x9vtLsfh3DNS6zOCEqk",
//                                           searchType: "image")
    
    lazy var searchManager = SearchManager(engineID: "014947724660651884946:uat8snwrscy", apiKey: "AIzaSyBoHgRVCa2UJtA0fQRm3OYtI35IPOALRmo", searchType: "image")

    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        if self.searchText.text != nil {
            self.queryText = self.searchText.text!
            self.getCurrentQuery(query: self.queryText)
        }
    }
    
    func getCurrentQuery(query: String) {
        
        searchManager.fetchCurrentSearchWith(query: query, startIndex: startIndex) { (response) in
            
            self.images += response.items
            
            let page = response.queries.nextPage
            for index in page {
                let startIndex = index.startIndex
                self.startIndex = startIndex
            }
            
            self.fetching = false
            
            var indexPaths = [AnyObject]()
            for i in (self.currentPage * 10)..<(self.currentPage * 10) + 10 {
                indexPaths.append(NSIndexPath(item: i, section: 0))
            }
            
            self.collectionView?.insertItems(at: indexPaths as! [IndexPath])
            self.currentPage += 1
            if self.currentPage < 3 {
                self.getCurrentQuery(query: query)
                
            }
            
            self.collectionView.reloadData()
            
        }
    }
    
    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.size.height) {
            if !self.fetching && self.currentPage < 10 {
                self.fetching = true
                getCurrentQuery(query: self.queryText)
                print(#function)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
