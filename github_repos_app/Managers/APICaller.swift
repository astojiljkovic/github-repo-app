//
//  APICaller.swift
//  github_repos_app
//
//  Created by Aleksa Stojiljkovic on 27.3.22..
//

import Foundation

struct Constants {
    static let baseURL = "https://api.github.com/search/repositories?q=created:>"
    
}


class APICaller {
    
    static let shared = APICaller()
    
    func getRepos(completion: @escaping (Result<[Repo],Error>) -> Void){

        let date = Calendar.current.date(byAdding: .day , value: -7, to: .now)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.string(from: date)
//        print(dateFormatter.string(from: date))
        var components = URLComponents()
            components.scheme = "https"
            components.host = "api.github.com"
            components.path = "/search/repositories"
            components.queryItems = [
                URLQueryItem(name: "q", value: "created:>\(dateFormatter.string(from: date))")
            ]

        guard let url = components.url else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            do{
                
                let results = try JSONDecoder().decode(ReposResponse.self, from: data)

                completion(.success(results.items))

            }catch(let error){
                
                print(error)


                completion(.failure(error))
                
            }
        }
        task.resume()
        
    }


    func search(with query: String, completion: @escaping(Result<[Repo],Error>) -> Void){
        //https://api.github.com/search/repositories?q=high-assurance-rust%20in:name,created:%3E2022-03-20
        
        
        let date = Calendar.current.date(byAdding: .day , value: -7, to: .now)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.string(from: date)
//        print(dateFormatter.string(from: date))
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)%20in:name,created:%3E\(dateFormatter.string(from: date))") else {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let result = try JSONDecoder().decode(ReposResponse.self, from: data)
                completion(.success(result.items))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
 
}

