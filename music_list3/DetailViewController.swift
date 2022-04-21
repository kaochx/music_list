//
//  DetailViewController.swift
//  music_list3
//
//  Created by White Kao on 2022/4/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var detail: Track?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = detail?.name
        artistLabel.text = detail?.artist
        urlLabel.text = detail?.collectionViewURL.absoluteString

        let url = detail?.artworkURL
        imageView.downloaded(from: url!)
    }

}


