//
//  FeedViewController.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/6/20.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedView: UITableView!
    
    enum Section {
        case main
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, FeedItem>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSnapShot()
    }
    
}

