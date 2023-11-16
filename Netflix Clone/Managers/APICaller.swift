//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 06/11/23.
//

import Foundation

struct Constants {
    static let API_KEY = "955ccfce0233f3b4ee2f28dbc4f2451a"
    static let baseUrl = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyB0eoWZc-XlIHPUolnjycZK3q_bRNdW1yY"
    static let YoutubeBaseUrl = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getData(urlString: String, completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, _ , error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        })
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url),
                                              completionHandler: { data, _ , error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        })
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement,Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        
        guard let url = URL(string: "\(Constants.YoutubeBaseUrl)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url),
                                              completionHandler: { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        })
        task.resume()
    }
    
}

// https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=955ccfce0233f3b4ee2f28dbc4f2451a
