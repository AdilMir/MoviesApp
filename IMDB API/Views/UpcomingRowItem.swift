//
//  UpcomingRowItem.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UpcomingRowItem: View {
	@State var movie: Title
	var body: some View {
		HStack(alignment: .center) {
			WebImage(url: movie.imagePath)
				.resizable()
				.placeholder(content: {
					ProgressView()
				})
				.scaledToFill()
				.frame(width: 100,height: 150)
				.clipped()
			
			Text(movie.original_name ?? movie.original_title ?? "Unknown")
			Spacer()
			Image(systemName: "play.circle.fill")
				.font(.largeTitle)
		}
		.frame(maxWidth: .infinity)
		.frame(height: 150)
	}
}


struct UpcomingRowItem_Previews: PreviewProvider {
    static var previews: some View {
		UpcomingRowItem(movie: Title(id: 0, mediaType: "", original_name: "This is the", original_title: "This is the name of the movie", poster_path: "/rxDPzExeovcBZY2IVWdYs87AzVE.jpg", overview: "", vote_count: 10, vote_average: 20.0))
    }
}
