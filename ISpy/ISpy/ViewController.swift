//
//  ViewController.swift
//  ISpy
//
//  Created by Sean Chien on 2019-08-28.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageview
        
    }
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageview.bounds.width
        let heightScale = size.height / imageview.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }


}

