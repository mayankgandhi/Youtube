//
//  FeedDetailViewController.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/7/20.
//

import UIKit

class FeedDetailViewController: UIViewController {

    let titleLabel = UILabel(frame: .zero)
    let channelTitleLabel = UILabel(frame: .zero)
    let viewsLabel = UILabel(frame: .zero)
    let timeStampLabel = UILabel(frame: .zero)
    
    let feedImageView = UIImageView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCell()
        // Do any additional setup after loading the view.
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
        
        view.addSubview(verticalStackView)
       
        feedImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
        
        verticalStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.centerXWithinMargins.equalToSuperview()
        }
       
    }
    
    func configureCell() {
        createLabels()
        configureStackView()
    }
    
    func loadView(_ item: FeedItem, image: UIImage) {
        titleLabel.text = item.title
        channelTitleLabel.text = item.channelTitle
        timeStampLabel.text = "\(item.timeStamp)"
        viewsLabel.text = "\(item.views) views"
        feedImageView.image = image
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
