//
//  ViewController.swift
//  myLab3
//
//  Created by Jorge Torres on 2022-03-29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainimage1880: UIImageView!
    
    @IBOutlet weak var descriptionLabel1880: UILabel!
    
    @IBOutlet weak var copyrightLabel1880: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel1880.text = ""
        copyrightLabel1880.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.descriptionLabel1880.text = photoInfo.description
                    self.updateUI(with: photoInfo)
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel1880.text = "Copyright\(copyright)"
                    }else{
                        self.copyrightLabel1880.isHidden = true
                    }
                }
            }
            
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo){
        let task = URLSession.shared.dataTask(with: photoInfo.url, completionHandler: {(data,response,error) in
            if let data = data,
               let image = UIImage(data:data){
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.mainimage1880.image = image
                    self.descriptionLabel1880.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright{
                        self.copyrightLabel1880.text = "Copyright \(copyright)"
                    }else{
                        self.copyrightLabel1880.isHidden = true
                    }
                }
            }
            guard let url = photoInfo.url.withHTTPS()
                else {return}
        })
        
        task.resume()
    }
    
    
    
}

