//
//  DetailViewController.swift
//  NewFreeApps
//
//  Created by Matt Long on 10/9/14.
//  Copyright (c) 2014 Matt Long. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: EntryMO? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: EntryMO = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.title ?? "Untitled"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

