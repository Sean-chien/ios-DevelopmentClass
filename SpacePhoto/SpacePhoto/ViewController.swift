//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Derrick Park on 9/17/19.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var imageView: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var copyRightLabel: UILabel!
  
  let activityIndicator: UIActivityIndicatorView = {
    let ai = UIActivityIndicatorView(style: .gray)
    ai.startAnimating()
    ai.translatesAutoresizingMaskIntoConstraints = false
    return ai
  }()
  
  let photoInfoController = PhotoInfoController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(activityIndicator)
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    descriptionLabel.text = ""
    copyRightLabel.text = ""
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    photoInfoController.fetchPhotoInfo { (photoInfo) in
      guard let photoInfo = photoInfo else { return }
      self.updateUI(with: photoInfo)
    }
  }

  private func updateUI(with photoInfo: PhotoInfo) {
    guard let httpsURL = photoInfo.url.withHTTPS() else { return }
    
    let task = URLSession.shared.dataTask(with: httpsURL) { (data, response, error) in
      
      guard let data = data, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        self.title = photoInfo.title
        self.imageView.image = image
        self.descriptionLabel.text = photoInfo.description
        
        if let copyright = photoInfo.copyright {
          self.copyRightLabel.text = "Copyright \(copyright)"
        } else {
          self.copyRightLabel.isHidden = true
        }
        // Status bar (below iPhone X - edge to edge display)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
      }
    }
    
    task.resume()
  }
}

