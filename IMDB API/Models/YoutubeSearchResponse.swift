//
//  YoutubeSearchResponse.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import Foundation


struct YoutubeSearchResponse: Decodable {
	let items: [VideoElement]
}

struct VideoElement: Decodable {
	let id : IdVideoElement
}

struct IdVideoElement: Decodable {
	let kind: String
	let videoId: String
}
