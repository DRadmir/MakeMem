//
//  EditorGestureRecognizer.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 21.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit

extension EditorViewController {
    
    func panGestureSetting() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panLabel(_:)))
        
        for i in labelArray {
            i.isUserInteractionEnabled = true
            i.addGestureRecognizer(panGesture)
        }
    }
    
    @objc func panLabel(_ sender: UIPanGestureRecognizer) {
        let view = sender.view
        
        for i in labelArray {
            if i == view {
                self.view.bringSubviewToFront(i)
                let translation = sender.translation(in: self.view)
                i.center = CGPoint(x: i.center.x + translation.x, y: i.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
        }
    }
    
    func tapGestureSetting() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_:)))
        
        for i in labelArray {
            tapGesture.numberOfTapsRequired = 1
            i.addGestureRecognizer(tapGesture)
            i.isUserInteractionEnabled = true
        }
    }
    
    @objc func tappedOnLabel(_ sender: UITapGestureRecognizer) {
        let view = sender.view
        for i in labelArray {
            if i == view {
                editingLabel = true
                textField.clearsOnBeginEditing = false
                
                textField.isHidden = false
                i.isHidden = true
                textField.text = i.text
                panGestureSetting()
            }
        }
    }
    
}
