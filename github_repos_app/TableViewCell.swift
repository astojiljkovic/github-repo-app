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
    
    //TODO podesi naravno malo veci size
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    //TODO pronadji kako ubaciti SF ovde
    let starImg: UIImage = {
//        let image = UIImage()
//        var image = UIImage(systemName: "play.circle",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        var image = UIImage(systemName: "star")
//        image?.withTintColor(.white)

        
        return image!
    }()
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        var image = UIImage(systemName: "star",withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))
//        image = image?.withRenderingMode(.alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let starImgView : UIImageView = {
        var imgView = UIImageView()
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
        starImgView.image = starImg
        contentView.addSubview(titleLabel)
//        contentView.addSubview(starImgView)
        contentView.addSubview(playTitleButton)
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
            starImgView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
//            starImgView.bottomAnchor.constraint(equalTo: descLabel.topAnchor, constant: 10)
        ]
        let playTitleButtonConstraints = [
            playTitleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            playTitleButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
            
            
        ]
        let numberOfStarsConstraints = [
            numberOfStars.leadingAnchor.constraint(equalTo: playTitleButton.trailingAnchor, constant: 10),
            numberOfStars.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
//            numberOfStars.bottomAnchor.constraint(equalTo: descLabel.topAnchor, constant: 20)
        ]
        
        let descLabelConstraints = [
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.topAnchor.constraint(equalTo: numberOfStars.bottomAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
//            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            
        ]
        
        
        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(starImgViewConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
        NSLayoutConstraint.activate(numberOfStarsConstraints)
        NSLayoutConstraint.activate(descLabelConstraints)
    }
    
    public func configure(with model: RepoViewModel){
        titleLabel.text = model.full_name
        descLabel.text = model.description
        numberOfStars.text = String(model.stargazers_count)
    }
    
}
