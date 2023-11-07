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
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(
            string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { [weak self] data, _ , error in
            
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
    
    func getTrendingTvs(completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(
            string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
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
    
    func getUpcomingMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
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
                completion(.failure(APIError.failedToGetData))
            }
            
        })
        
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
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
                completion(.failure(APIError.failedToGetData))
            }
            
        })
        task.resume()
        
    }
    
    func getTopRated(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=955ccfce0233f3b4ee2f28dbc4f2451a&language=en-US&page=1") else {
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
                completion(.failure(APIError.failedToGetData))
            }
            
        })
        task.resume()
        
    }
}
