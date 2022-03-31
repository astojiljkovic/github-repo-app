//
//  Repo.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 26.3.22..
//

import Foundation


struct ReposResponse: Codable {
    let items: [Repo]
}

struct Repo: Codable {
//    let allow_forking: Int
    let name: String?
    let full_name: String?
    let description: String?
    let forks_count: Int?
    let stargazers_count: Int?
    let id: Int
    let owner: Owner
}
struct Owner: Codable {
    let avatar_url: String?
}
