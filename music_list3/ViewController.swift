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
    
    private var apiService: ItunesQueryService = ItunesQueryService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.tracksUpdate = {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiService.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: cell = cell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = apiService.tracks[indexPath.row].name
        cell.detailTextLabel?.text = apiService.tracks[indexPath.row].artist
        //cell.imageView?.downloaded(from: apiService.tracks[indexPath.row].artworkURL)
        if let data = NSData(contentsOf: apiService.tracks[indexPath.row].artworkURL){
            cell.imageView?.image = UIImage(data: data as Data, scale: 12)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Segue的方式進入下一個畫面
        performSegue(withIdentifier: "showDetails", sender: self)
        //deselect the cell when go back to tableview
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //傳到下一個畫面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.detail = apiService.tracks[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
    
}



