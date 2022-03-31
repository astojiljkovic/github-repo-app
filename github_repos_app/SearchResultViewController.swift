//
//  SearchResultViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 31.3.22..
//

import Foundation
import UIKit


protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidTapItem(_ viewModel: RepoPreviewViewModel)
}

class SearchResultViewController: UIViewController {
    
    public var repos: [Repo] = []
    
    public weak var delegate: SearchResultsViewControllerDelegate?
    
    public let table: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        return table
    }()
    
    var label: UILabel = {
        var label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        view.backgroundColor = .systemBackground
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    

    
}
extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
                let nesto = UITableViewCell()
                return nesto
            }

        let repo = repos[indexPath.row]

        cell.configure(with: RepoViewModel(full_name: repo.full_name ?? " ", description: repo.description ?? " ", stargazers_count: repo.stargazers_count ?? 0))

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repo = repos[indexPath.row]
        

        self.delegate?.searchResultsViewControllerDidTapItem(RepoPreviewViewModel(title: repo.name ?? "", fullName: repo.full_name ?? "", description: repo.description ?? "", numberOfStars: repo.stargazers_count ?? 0, numberOfForks: repo.forks_count ?? 0, avatar_url: repo.owner.avatar_url!))
        
      


//        let vc = RepoDetailsViewController()
//
//        vc.configure(with: RepoPreviewViewModel(title: repo.name ?? "", fullName: repo.full_name ?? "", description: repo.description ?? "", numberOfStars: repo.stargazers_count ?? 0, numberOfForks: repo.forks_count ?? 0, avatar_url: repo.owner.avatar_url ?? ""))
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
