
//  ViewController.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 26.3.22..
//

import UIKit

class ViewController: UIViewController {
    
    private var repos: [Repo] = []
        
    
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

        

        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func fetchData () {
//        Task{ [weak self] in
//            let repos = await APICaller.shared.getRepos2()
//            let firstCellIndex = self?.repos.count ?? 0
//            let lastCellIndex = firstCellIndex + repos.count - 1
//            self?.repos.append(contentsOf: repos)
//
//            DispatchQueue.main.async { [weak self] in
//                var indexPaths = Array((firstCellIndex...lastCellIndex)).map { index in
//                    IndexPath(row: index , section: 0)
//                }
//                self?.table.insertRows(at: indexPaths, with: .right)
//            }
//
//        }
     
        APICaller.shared.getRepos { [weak self] result in
            switch result {
            case .success(let repos):
                let firstCellIndex = self?.repos.count ?? 0
                var lastCellIndex = firstCellIndex + repos.count - 1
                self?.repos.append(contentsOf: repos)

                DispatchQueue.main.async {
                    var indexPaths = Array((firstCellIndex...lastCellIndex)).map { index in
                        IndexPath(row: index , section: 0)
                    }
                    self?.table.insertRows(at: indexPaths, with: .none)

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
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
                let nesto = UITableViewCell()
                return nesto
            }
        sortList()
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
        
        guard let repoName = repo.name else {return}
        guard let repoFullName = repo.full_name else {return}
        let description = repo.description ?? ""
        guard let stargazers_count = repo.stargazers_count else {return}
        guard let numberOfForks = repo.forks_count else {return}
        
        
        let vc = RepoDetailsViewController()
        
        vc.configure(with: RepoPreviewViewModel(title: repoName, fullName: repoFullName, description: description, numberOfStars: stargazers_count, numberOfForks: numberOfForks, avatar_url: repo.owner.avatar_url ?? ""))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repos.count - 1 {
            fetchData()
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
//    }
    

    
}
