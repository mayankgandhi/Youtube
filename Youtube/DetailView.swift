//
//  DetailView.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/7/20.
//

import UIKit

class DetailView: UIView {
    
    static let reuseId = "FeedCell"
    
    let titleLabel = UILabel(frame: .zero)
    let channelTitleLabel = UILabel(frame: .zero)
    let viewsLabel = UILabel(frame: .zero)
    let timeStampLabel = UILabel(frame: .zero)
    let feedImageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        
        feedImageView.snp.makeConstraints { (make) in
            make.height.lessThanOrEqualToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { (make) in
            make.size.width.equalToSuperview().offset(-10)
            make.size.height.equalTo(400)
            make.center.equalToSuperview()
        }
    }
    
    func configureCell() {
        createLabels()
        createImageView()
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
