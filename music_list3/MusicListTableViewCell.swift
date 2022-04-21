//
//  MusicListTableViewCell.swift
//  music_list3
//
//  Created by White Kao on 2022/4/19.
//

import UIKit


class cell: UITableViewCell {

    let identifier = "MusicListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customize cell
        let spacing = 10
        self.imageView?.frame = CGRect(
            x: spacing,
            y: spacing,
            width: Int(contentView.frame.height) - (spacing * 2),
            height: Int(contentView.frame.height) - (spacing * 2))
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.textLabel?.frame = CGRect(
            x: Int(CGFloat((spacing * 2)) + (imageView?.frame.width)!),
            y: -spacing,
            width: Int(contentView.frame.width - (imageView?.frame.width)!),
            height: 150)
        self.detailTextLabel?.frame = CGRect(
            x: Int(CGFloat((spacing * 2)) + (imageView?.frame.width)!),
            y: spacing,
            width: Int(contentView.frame.width - (imageView?.frame.width)!),
            height: 150)
    }
}
