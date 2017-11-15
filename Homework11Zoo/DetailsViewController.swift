//
//  DetailsViewController.swift
//  Homework11Zoo
//
//  Created by mac on 14.11.2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var animal : Animals?
    

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var kindName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = animal?.name
        kindName.text = animal?.kind
        nameLabel.text = animal?.name
        imageOutlet.image = animal?.image
    }
}
