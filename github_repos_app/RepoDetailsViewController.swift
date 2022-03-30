//
//  RepoDetailsViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 28.3.22..
//

import Foundation
import UIKit

class RepoDetailsViewController: UIViewController {
    
    private let starPic: UIButton = {
        let button = UIButton()
        var image = UIImage(systemName: "star.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))
//        image = image?.withRenderingMode(.alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    private let forkPic: UIButton = {
        let button = UIButton()
        var image = UIImage(systemName: "tuningfork",withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))
//        image = image?.withRenderingMode(.alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    var avatarImg: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    var fullNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var numberOfStars: UILabel = {
        var label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false


        return label
    }()
    
    var numberOfForks: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let attrs = [
//            NSAttributedString.Key.foregroundColor: UIColor.white,
//            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 5)!
//        ]
//
//        UINavigationBar.appearance().titleTextAttributes = attrs
        
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(avatarImg)
//        view.addSubview(fullNameLabel)
//        navigationItem.title = fullNameLabel.text
        view.addSubview(starPic)
        view.addSubview(forkPic)
        view.addSubview(descriptionLabel)
        view.addSubview(numberOfStars)
        view.addSubview(numberOfForks)
        
        applyConstraints()
        
    
    }
//    override func viewDidAppear(_ animated: Bool) {
////        let nav = self.navigationController?.navigationBar
////        nav!.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "CaviarDreams", size: 10)]
//        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 10)!]
//        UINavigationBar.appearance().titleTextAttributes = attributes
//        navigationItem.title = fullNameLabel.text
//
//    }
    
    func applyConstraints(){
        
//        let avatarImgConstraints = [
//            avatarImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
//            avatarImg.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
//            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let starPicConstraints = [
            starPic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            starPic.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
        ]
        
        let numberOfStarsConstraint = [
            numberOfStars.leadingAnchor.constraint(equalTo: starPic.trailingAnchor, constant: 15),
            numberOfStars.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
//            numberOfStars.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            numberOfStars.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let forkPicConstraints = [
            forkPic.leadingAnchor.constraint(equalTo: numberOfStars.trailingAnchor, constant: 20),
            forkPic.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
        ]
        let numberOfForksConstraint = [
//            numberOfForks.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            numberOfForks.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            numberOfForks.leadingAnchor.constraint(equalTo: forkPic.trailingAnchor, constant: 15),
//            numberOfForks.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            numberOfForks.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
//        NSLayoutConstraint.activate(avatarImgConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(starPicConstraints)
        NSLayoutConstraint.activate(numberOfStarsConstraint)
        NSLayoutConstraint.activate(forkPicConstraints)
        NSLayoutConstraint.activate(numberOfForksConstraint)
        
    }
    func configure(with model: RepoPreviewViewModel){
        
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        numberOfStars.text = "\(String(model.numberOfStars)) Stars"
        numberOfForks.text = "\(String(model.numberOfForks)) Forks"
        fullNameLabel.text = model.fullName
//        title = fullNameLabel.text
//        navigationItem.title = fullNameLabel.text
        
        
//        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeVideo.id.videoId)") else {return}
//        webView.load(URLRequest(url: url))
    }
}
