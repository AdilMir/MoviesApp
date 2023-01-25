//
//  UpcomingView.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UpcomingView: View {
	@ObservedObject var viewModel: HomeViewModel
    var body: some View {
		
		List(viewModel.upcomingMovies) { movie in
			UpcomingRowItem(movie: movie)
		}
		.navigationTitle("Upcoming")
		.ignoresSafeArea(edges:.horizontal)
		.listStyle(.plain)
    }
}

struct UpcomingView_Previews: PreviewProvider {
	static var letViewModel = HomeViewModel(upcomingMovies: [Title(id: 0, mediaType: "", original_name: "This is the", original_title: "This is the name of the movie", poster_path: "/rxDPzExeovcBZY2IVWdYs87AzVE.jpg", overview: "", vote_count: 10, vote_average: 20.0)])
	
    static var previews: some View {
		NavigationStack {
			UpcomingView(viewModel: letViewModel)
		}
    }
}
