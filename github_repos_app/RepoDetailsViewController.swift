//
//  RepoDetailsViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 28.3.22..
//

import Foundation
import UIKit

class RepoDetailsViewController: UIViewController {
    
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
        return label
    }()
    
    var numberOfStars: UILabel = {
        var label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 2
        //vidi kako da rasiris ovo cudo od bordera

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
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(avatarImg)
        view.addSubview(fullNameLabel)
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
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let numberOfStarsConstraint = [
//            numberOfStars.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            numberOfStars.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
//            numberOfStars.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            numberOfStars.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -50)
        ]
        let numberOfForksConstraint = [
//            numberOfForks.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            numberOfForks.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            numberOfForks.leadingAnchor.constraint(equalTo: numberOfStars.trailingAnchor, constant: 25),
//            numberOfForks.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            numberOfForks.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
//        NSLayoutConstraint.activate(avatarImgConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(numberOfStarsConstraint)
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
