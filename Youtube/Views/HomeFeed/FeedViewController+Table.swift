//
//  FeedViewController+Table.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/6/20.
//

import Foundation
import UIKit

extension FeedViewController {
    
    func configureTableView() {
        feedView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.reuseId)
        dataSource = UITableViewDiffableDataSource<Section, FeedItem>(tableView: feedView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.reuseId) as? FeedCell
            cell?.loadView(item)
            return cell
        })
    }
    
    func setupSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, FeedItem>()
        snapShot.appendSections([.main])
        snapShot.appendItems(FeedItem.data, toSection: .main)
        dataSource.apply(snapShot)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = FeedDetailViewController()
        if let cell = tableView.cellForRow(at: indexPath) as? FeedCell {
            detailVC.loadView(FeedItem.data[indexPath.row], image: cell.feedImageView.image!)
            navigationController?.pushViewController(detailVC, animated: true)
        }

    }

}
