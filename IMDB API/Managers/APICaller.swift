//
//  APICaller.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import Foundation

import Foundation
struct Constants {
	static let APIKey = "8ac52955b45a89e282b3ea8df38958f1"
	static let YoutubeAPIKay = "AIzaSyCPalVrJurk0GjF3NK_CjNcO1pA5s76rkM"
	static let baseUrl = "https://api.themoviedb.org"
	static let youtubeURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
	case failedToGetData
}

class APICaller {
	static let shared = APICaller()
	
	func getTrendingMovies(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.APIKey)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				print(error.localizedDescription)
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func getTrendingTvSeries(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.APIKey)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				print(error.localizedDescription)
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func getUpcomingMovies(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.APIKey)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				print(error.localizedDescription)
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func getPopular(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.APIKey)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				print(error.localizedDescription)
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func getTopRated(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.APIKey)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				print(error.localizedDescription)
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func fetchDiscoverMovies(completion:@escaping (Result<[Title],Error>) -> ()) {
		guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.APIKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				completion(.failure(APIError.failedToGetData))
				print(error.localizedDescription)
			}
		}
		dataTask.resume()
	}
	
	func search(with query: String, completion:@escaping (Result<[Title],Error>) -> ()) {
		//https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
		guard let qureyString = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
		guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.APIKey)&query=\(qureyString)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(TitleResponse.self, from: data)
				completion(.success(results.results))
			} catch {
				completion(.failure(APIError.failedToGetData))
			}
		}
		dataTask.resume()
	}
	
	func getMovie(with query: String, completion:@escaping (Result<VideoElement,Error>) -> ()) {
		guard let qureyString = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
		guard let url = URL(string: "\(Constants.youtubeURL)q=\(qureyString)&key=\(Constants.YoutubeAPIKay)") else {return}
		let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
			guard let data = data,error == nil else {
				completion(.failure(error ?? APIError.failedToGetData))
				return
			}
			do {
				let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
				completion(.success(results.items[0]))
			} catch {
				completion(.failure(APIError.failedToGetData))
				print(error.localizedDescription)
			}
		}
		dataTask.resume()
		
	}
	
	//https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
}
