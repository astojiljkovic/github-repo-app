//
//  TableViewCell.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 26.3.22..
//

import Foundation
import UIKit


class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    let starImgView : UIImageView = {
        var imgView = UIImageView(image: UIImage(systemName: "star"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.tintColor = .white
        return imgView
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let numberOfStars: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground

        contentView.addSubview(titleLabel)
        contentView.addSubview(starImgView)
        contentView.addSubview(numberOfStars)
        contentView.addSubview(descLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints(){
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ]
        
        let starImgViewConstraints = [
            starImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            starImgView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            starImgView.widthAnchor.constraint(equalToConstant: 20),
            starImgView.heightAnchor.constraint(equalToConstant: 20)
        ]

        let numberOfStarsConstraints = [
            numberOfStars.leadingAnchor.constraint(equalTo: starImgView.trailingAnchor, constant: 10),
            numberOfStars.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
        ]
        
        let descLabelConstraints = [
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.topAnchor.constraint(equalTo: numberOfStars.bottomAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
        ]
        
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(starImgViewConstraints)
        NSLayoutConstraint.activate(numberOfStarsConstraints)
        NSLayoutConstraint.activate(descLabelConstraints)
    }
    
    public func configure(with model: RepoViewModel){
        titleLabel.text = model.full_name
        descLabel.text = model.description
        numberOfStars.text = String(model.stargazers_count)
    }
    
}
