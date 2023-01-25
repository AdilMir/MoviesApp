//
//  HomeRowItem.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeRowItem: View {
	@ObservedObject var viewModel: HomeViewModel
	var title: String
	var section: Section
	
	var body: some View {
		VStack(alignment:.leading) {
			Text(title)
				.foregroundColor(.white)
				.font(.title2)
			ScrollView(.horizontal) {
				LazyHStack(spacing:10) {
					ForEach(viewModel.returnTitleForSection(section: section)) { movie in
						WebImage(url: movie.imagePath)
							.resizable()
							.placeholder(content: {
								ProgressView()
							})
							.scaledToFill()
							.frame(width: 144,height: 200)
							.clipped()
					}
				}
			}
		}
		.onAppear {
			viewModel.callApiForSection(section: section)
		}
	}
}


struct HomeRowItem_Previews: PreviewProvider {
	
	static let homeViewModel = HomeViewModel()
    static var previews: some View {
		HomeRowItem(viewModel: homeViewModel, title: "Trending", section: .TrendindMovies)
    }
}
