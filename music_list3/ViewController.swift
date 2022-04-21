//
//  ViewController.swift
//  music_list3
//
//  Created by White Kao on 2022/4/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiService.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(
        //    withIdentifier: ) as? cell
        let cell: cell = cell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        //var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        if (!(cell != nil)) {
//
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//        }
        
        cell.textLabel?.text = apiService.tracks[indexPath.row].name
        cell.detailTextLabel?.text = apiService.tracks[indexPath.row].artist
       
       cell.imageView?.downloaded(from: apiService.tracks[indexPath.row].artworkURL)
        
        //cell?.imageView?.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
//        var imageView2: UIImageView
//        imageView2.downloaded(from: apiService.tracks[indexPath.row].artworkURL)
        
        //cell?.imageView?.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.darkGray)
        //cell?.imageView?.image = imageView2
        //let cell : MusicListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MusicListTableViewCell
       // cell?.textLabel?.text = apiService.tracks[indexPath.row].name
       // cell?.detailTextLabel!.text = apiService.tracks[indexPath.row].artist
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Segue的方式進入下一個畫面
        performSegue(withIdentifier: "showDetails", sender: self)
        //deselect the cell when go back to tableview
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //傳送資料到下一個畫面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.detail = apiService.tracks[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    var apiService: ItunesQueryService = {
        let i = ItunesQueryService()
//        i.tracksUpdate = {
//            print(i.tracks[0].artist)
//        }
        return i
    }()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}

extension UIImageView {
       func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
          contentMode = mode
          URLSession.shared.dataTask(with: url) { data, response, error in
              guard
                  let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
                  else { return }
              DispatchQueue.main.async() { [weak self] in
                  self?.image = image
              }
          }.resume()
      }
//      func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//          guard let url = URL(string: link) else { return }
//          downloaded(from: url, contentMode: mode)
//      }
  }

