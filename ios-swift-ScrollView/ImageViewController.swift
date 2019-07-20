//
//  ImageViewController.swift
//  ios-swift-ScrollView
//
//  Created by yasmeen on 7/20/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    var imageUrl : URL!{
        didSet{
            imageview.image = nil
            if view.window != nil{
                fichImage()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageUrl == nil{
            self.imageUrl = Bundle.main.url(forResource: "1", withExtension: "jpg")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageview.image == nil{
            fichImage()
        }
    }
    func fichImage()  {
        if let url = imageUrl{
            do{
                let urlcontents = try? Data(contentsOf: url)
                if let imageData = urlcontents{
                    imageview.image = UIImage(data: imageData)
                }
            }
        }
    }
    
}
