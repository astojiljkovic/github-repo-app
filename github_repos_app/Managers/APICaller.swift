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

        var components = URLComponents()
            components.scheme = "https"
            components.host = "api.github.com"
            components.path = "/search/repositories"
            components.queryItems = [
                URLQueryItem(name: "q", value: "created:>\(dateFormatter.string(from: date))")
            ]
//        print(components.url)
        guard let url = components.url else {return}

//        print("ovde sam oopet")

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            do{
                
                let results = try JSONDecoder().decode(ReposResponse.self, from: data)
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//               let results = try decoder.decode(ReposResponse.self, from: data)
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)

                completion(.success(results.items))
//                print("u do")
            }catch(let error){
                
                print(error)
//                print("u catch")

                completion(.failure(error))
                
            }
        }
        task.resume()
        
    }
//    func getRepos2() async -> [Repo]{
//
//        let date = Calendar.current.date(byAdding: .day , value: -7, to: .now)!
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-dd"
//        dateFormatter.string(from: date)
//
//        var components = URLComponents()
//            components.scheme = "https"
//            components.host = "api.github.com"
//            components.path = "/search/repositories"
//            components.queryItems = [
//                URLQueryItem(name: "q", value: "created:>\(dateFormatter.string(from: date))")
//            ]
////        print(components.url)
//        guard let url = components.url else {return []}
//
////        print("ovde sam oopet")
//
//        do{
//            let (data , _) = try await URLSession.shared.data(from: url)
//            let results = try JSONDecoder().decode(ReposResponse.self, from: data)
//            return results.items
//        }catch(let error){
//            print(error)
//            return []
//        }
//    }

 
}
extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

