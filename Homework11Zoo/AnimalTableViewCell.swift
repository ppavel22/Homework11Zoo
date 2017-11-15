//
//  AnimalTableViewCell.swift
//  Homework11Zoo
//
//  Created by mac on 14.11.2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet private weak var ibImageView: UIImageView!
    @IBOutlet private weak var ibTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func update(title: String, image: UIImage) {
        ibImageView.image = image
        ibTitle.text = title
    }
}
