//
//  ViewController.swift
//  testOnix
//
//  Created by Alex Syvolap on 16.09.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goToSite: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickGoToSiteButton(_ sender: UIButton) {
        let siteUrl = URL(string: "http://numbersapi.com/random/year")!
        loader.startAnimating()
        AF.request(siteUrl).response { response in
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                
                self.resultLabel.text = json
//                self.resultLabel.numberOfLines = 0
//                let maximumLabelSize: CGSize = CGSize(width: 280, height: 999)
//                let expectedLabelSize: CGSize = self.resultLabel.sizeThatFits(maximumLabelSize)
//                var newFrame: CGRect = self.resultLabel.frame
//                newFrame.size.height = expectedLabelSize.height
//                self.resultLabel.frame = newFrame
                
                self.loader.stopAnimating()
            }
        }
    }
    
}

