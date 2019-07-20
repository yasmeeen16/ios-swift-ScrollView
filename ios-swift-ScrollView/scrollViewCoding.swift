//
//  scrollViewCoding.swift
//  ios-swift-ScrollView
//
//  Created by yasmeen on 7/20/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class scrollViewCoding: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!{
        didSet{
            scrollview.addSubview(imageview)
            scrollview.minimumZoomScale = 1/25
            scrollview.maximumZoomScale = 1.0
            scrollview.delegate = self
        }
    }

  var imageview = UIImageView()
    var imageUrl : URL!{
        didSet{
            image = nil
 
            if view.window != nil{
                fichImage()
            }
        }
        
    }
    private var image : UIImage? {
        get {
            return imageview.image
        }
        set{
            imageview.image = newValue
            imageview.sizeToFit()
            scrollview.contentSize = imageview.frame.size
            
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
                    image = UIImage(data: imageData)
                    //imageview.sizeToFit()
                    //scrollview.contentSize = imageview.frame.size
                }
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageview
    }

}
