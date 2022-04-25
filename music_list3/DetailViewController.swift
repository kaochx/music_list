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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1)  { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
