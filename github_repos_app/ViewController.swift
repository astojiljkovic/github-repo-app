
//  ViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 26.3.22..
//

import UIKit

class ViewController: UIViewController {
    
    private var repos: [Repo] = [Repo]()
    
//    let labelica: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()

    
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        return table
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        title = "Github Trends"
        
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
        fetchData()
//        view.addSubview(labelica)
        //mora da se napravi posebno pa preko navbara da se nagalvi labelica sa naslovom u centar
//        navigationItem.
        
        
        //TODO proveri ovde zato sto kada se okrene ekran nije lepa tabela preko celog ekrana
        

        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func fetchData () {
        APICaller.shared.getRepos { [weak self] result in
            switch result {
            case .success(let repos):

//                print("\(repos) wowoowowowow")
                
                self?.repos = repos
//                try self?.repos.sorted(by: {$0.stargazers_count > $1.stargazers_count})
                
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            case .failure(let error):
                print("pera perica")
                print(error.localizedDescription)

            }
        }

    }
    func sortList(){
        repos = repos.sorted(by: {$0.stargazers_count! > $1.stargazers_count!})
    }



}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(repos.count)
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
                let nesto = UITableViewCell()
                return nesto
            }
        sortList()
        let repo = repos[indexPath.row]
//        print(repo)
        cell.configure(with: RepoViewModel(full_name: repo.full_name ?? " ", description: repo.description ?? " ", stargazers_count: repo.stargazers_count ?? 0))
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let repo = repos[indexPath.row]
        
        guard let repoName = repo.name else {return}
        guard let repoFullName = repo.full_name else {return}
        let description = repo.description ?? ""
        guard let stargazers_count = repo.stargazers_count else {return}
        guard let numberOfForks = repo.forks_count else {return}
        
        let vc = RepoDetailsViewController()
        
        vc.configure(with: RepoPreviewViewModel(title: repoName, fullName: repoFullName, description: description, numberOfStars: stargazers_count, numberOfForks: numberOfForks))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repos.count - 1 {
            print("na kraju smo")
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
//    }
    

    
}
