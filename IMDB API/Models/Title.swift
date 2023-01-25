//
//  Title.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import Foundation

struct TitleResponse: Decodable {
	let results : [Title]
}

struct Title: Decodable , Identifiable {
	let id: Int
	let mediaType: String?
	let original_name: String?
	let original_title: String?
	let poster_path: String?
	let overview: String?
	let vote_count: Int?
	let vote_average:Double?
	
	var imagePath : URL? {
		guard let path = poster_path else{
			return nil
		}
	
		return URL(string: "https://image.tmdb.org/t/p/w400/\(path)")
	}
}
