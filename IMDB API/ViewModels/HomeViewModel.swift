//
//  HomeViewModel.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import Foundation

enum Section:Int {
	case TrendindMovies = 0
	case TrendingTv
	case Popular
	case Upcoming
	case TopRated
}

class HomeViewModel: ObservableObject {

	@Published var trendingMovies = [Title]()
	@Published var trendingTvSeries = [Title]()
	@Published var popularMovies = [Title]()
	@Published var upcomingMovies = [Title]()
	@Published var topRatedMovies = [Title]()
	@Published var headerObj: Title?
	@Published var showAlert = false
	@Published var alertTitle = ""
	
	init(trendingMovies: [Title] = [Title](), trendingTvSeries: [Title] = [Title](), popularMovies: [Title] = [Title](), upcomingMovies: [Title] = [Title](), topRatedMovies: [Title] = [Title](), headerObj: Title? = nil, showAlert: Bool = false, alertTitle: String = "") {
		self.trendingMovies = trendingMovies
		self.trendingTvSeries = trendingTvSeries
		self.popularMovies = popularMovies
		self.upcomingMovies = upcomingMovies
		self.topRatedMovies = topRatedMovies
		self.headerObj = headerObj
		self.showAlert = showAlert
		self.alertTitle = alertTitle
	}
	
	func fetchTrendingMovies() {
		APICaller.shared.getTrendingMovies {[weak self] result in
			switch result {
				case .success(let trendingMov):
					DispatchQueue.main.async {
						self?.trendingMovies = trendingMov
						self?.headerObj = trendingMov.randomElement()
					}
				case .failure(let failure):
					DispatchQueue.main.async {
						self?.showAlert = true
						self?.alertTitle = failure.localizedDescription
					}
			}
		}
	}
	
	func fetchTrendingTvSeries() {
		APICaller.shared.getTrendingTvSeries {[weak self] result in
			switch result {
				case .success(let tvSeries):
					DispatchQueue.main.async {
						self?.trendingTvSeries = tvSeries
					}
				case .failure(let failure):
					DispatchQueue.main.async {
						self?.showAlert = true
						self?.alertTitle = failure.localizedDescription
					}
			}
		}
	}
	
	func fetchUpcomingMovies() {
		APICaller.shared.getUpcomingMovies {[weak self] result in
			switch result {
				case .success(let upcomingMov):
					DispatchQueue.main.async {
						self?.upcomingMovies = upcomingMov
					}
				case .failure(let failure):
					DispatchQueue.main.async {
						self?.showAlert = true
						self?.alertTitle = failure.localizedDescription
					}
			}
		}
	}
	
	func fetchPopularMovies() {
		APICaller.shared.getPopular {[weak self] result in
			switch result {
				case .success(let popularMov):
					DispatchQueue.main.async {
						self?.popularMovies = popularMov
					}
				case .failure(let failure):
					DispatchQueue.main.async {
						self?.showAlert = true
						self?.alertTitle = failure.localizedDescription
					}
			}
		}
	}
	
	func fetchTopRatedMovies() {
		APICaller.shared.getTopRated {[weak self] result in
			switch result {
				case .success(let topRatedMov):
					DispatchQueue.main.async {
						self?.topRatedMovies = topRatedMov
					}
				case .failure(let failure):
					DispatchQueue.main.async {
						self?.showAlert = true
						self?.alertTitle = failure.localizedDescription
					}
			}
		}
	}
	
	func returnTitleForSection(section:Section) -> [Title] {
		switch section {
			case .TrendindMovies:
				return trendingMovies
			case .TrendingTv:
				return trendingTvSeries
			case .Popular:
				return popularMovies
			case .Upcoming:
				return upcomingMovies
			case .TopRated:
				return topRatedMovies
		}
	}
	
	func callApiForSection(section:Section) {
		switch section {
			case .TrendindMovies:
				fetchTrendingMovies()
			case .TrendingTv:
				fetchTrendingTvSeries()
			case .Popular:
				fetchPopularMovies()
			case .Upcoming:
				fetchUpcomingMovies()
			case .TopRated:
				fetchTopRatedMovies()
		}
	}

}
