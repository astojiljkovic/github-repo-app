//
//  RepoDetailsViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 28.3.22..
//

import Foundation
import UIKit

class RepoDetailsViewController: UIViewController {
    
    let starImgView : UIImageView = {
        var imgView = UIImageView(image: UIImage(systemName: "star.fill"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.tintColor = .white
        return imgView
    }()
    
    let forkImgView : UIImageView = {
        var imgView = UIImageView(image: UIImage(systemName: "tuningfork"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.tintColor = .white
        return imgView
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

        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(avatarImg)
        navigationItem.largeTitleDisplayMode = .never
        title = fullNameLabel.text
        view.addSubview(starImgView)
        view.addSubview(forkImgView)
        view.addSubview(descriptionLabel)
        view.addSubview(numberOfStars)
        view.addSubview(numberOfForks)
        
        applyConstraints()
        
    
    }

    func applyConstraints(){
        
        let avatarImgConstraints = [
            avatarImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            avatarImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImg.widthAnchor.constraint(equalToConstant: 150),
            avatarImg.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: avatarImg.bottomAnchor, constant: 70),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        

        let starImgViewConstraints = [
            starImgView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            starImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65),
            starImgView.widthAnchor.constraint(equalToConstant: 20),
            starImgView.heightAnchor.constraint(equalToConstant: 20),
            
        ]
        
        let numberOfStarsConstraint = [
            numberOfStars.leadingAnchor.constraint(equalTo: starImgView.trailingAnchor, constant: 10),
            numberOfStars.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),

        ]

        let forkImgViewConstraints = [
            forkImgView.leadingAnchor.constraint(equalTo: numberOfStars.trailingAnchor, constant: 35),
            forkImgView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            forkImgView.widthAnchor.constraint(equalToConstant: 20),
            forkImgView.heightAnchor.constraint(equalToConstant: 20)
        ]
        let numberOfForksConstraint = [
            numberOfForks.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            numberOfForks.leadingAnchor.constraint(equalTo: forkImgView.trailingAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(avatarImgConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        NSLayoutConstraint.activate(starImgViewConstraints)
        NSLayoutConstraint.activate(numberOfStarsConstraint)
        NSLayoutConstraint.activate(forkImgViewConstraints)
        NSLayoutConstraint.activate(numberOfForksConstraint)
        
    }
    func configure(with model: RepoPreviewViewModel){
        
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        numberOfStars.text = "\(String(model.numberOfStars))"
        numberOfForks.text = "\(String(model.numberOfForks))"
        fullNameLabel.text = model.fullName
        guard let url = URL(string: model.avatar_url) else {return}
        avatarImg.load(url: url)
                
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async{ [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                    
                }
            }
            
        }
    }
}
