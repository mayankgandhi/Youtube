//
//  FeedCell.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/6/20.
//

import UIKit
import SnapKit

class FeedCell: UITableViewCell {
    
    static let reuseId = "FeedCell"
    
    let titleLabel = UILabel(frame: .zero)
    let channelTitleLabel = UILabel(frame: .zero)
    let viewsLabel = UILabel(frame: .zero)
    let timeStampLabel = UILabel(frame: .zero)

    let feedImageView = UIImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = titleLabel.font.withSize(20)
        channelTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStampLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createImageView() {
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    func configureStackView() {
        let horizontalStackView = UIStackView(frame: .zero)
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = CGFloat(10)
        
        horizontalStackView.addArrangedSubview(channelTitleLabel)
        horizontalStackView.addArrangedSubview(viewsLabel)
        horizontalStackView.addArrangedSubview(timeStampLabel)
        
        let verticalStackView = UIStackView(frame: .zero)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = CGFloat(10)
        verticalStackView.spacing = CGFloat(10)
        
        verticalStackView.addArrangedSubview(feedImageView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        contentView.addSubview(verticalStackView)
        
        feedImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
        
        verticalStackView.snp.makeConstraints { (make) in
            make.size.width.equalToSuperview().offset(-10)
            make.center.equalToSuperview()
        }
    }
    
    func configureCell() {
        createLabels()
        configureStackView()
    }

    func loadView(_ item: FeedItem) {
        feedImageView.load(url: item.imageURL)
        titleLabel.text = item.title
        channelTitleLabel.text = item.channelTitle
        timeStampLabel.text = "\(item.timeStamp)"
        viewsLabel.text = "\(item.views) views"
    }
    
    func action() {
        print(titleLabel.text)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

