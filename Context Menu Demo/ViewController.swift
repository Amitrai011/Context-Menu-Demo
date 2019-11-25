//
//  ViewController.swift
//  Context Menu Demo
//
//  Created by Amol Rai on 24/11/19.
//  Copyright © 2019 Amit Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interaction = UIContextMenuInteraction(delegate: self)
        imageView.addInteraction(interaction)
        imageView.isUserInteractionEnabled = true
        
        imageView.layer.cornerRadius = 10
    }
    
       func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
            return self.createContextMenu()
        }
     }
    
    func createContextMenu() -> UIMenu {
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
            print("Share")
        }
        
        let copy = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { _ in
            print("Copy")
        }
        
        let saveToPhotos = UIAction(title: "Add To Photos", image: UIImage(systemName: "photo")) { _ in
            print("Save to Photos")
        }
        
        return UIMenu(title: "", children: [shareAction, copy, saveToPhotos])
    }
}
