//
//  HomeView.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
	
	let sectionTitles = ["Trending Movies","Trending TV","Popular","Upcoming Movies","Top Rated"]
	
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		List {
			//Header View
			headerView
			
			//Cells
			ForEach(0..<sectionTitles.count, id: \.self) { index in
				HomeRowItem(viewModel: viewModel, title: sectionTitles[index], section: Section(rawValue: index) ?? .TrendindMovies)
			}
		}
		.navigationBarTitleDisplayMode(.large)
		.navigationTitle("Movies")
		.listStyle(.plain)
	}
}

extension HomeView {
	private var headerView: some View {
		ZStack() {
			WebImage(url: viewModel.headerObj?.imagePath)
				.resizable()
				.placeholder(content: {
					ProgressView()
				})
				.scaledToFill()
				.frame(height: 450)
				.frame(maxWidth: .infinity)
				.clipped()
			.overlay {
				LinearGradient(colors: [.clear,.black], startPoint: .top, endPoint: .bottom)
				
			}
			.frame(height: 450)
			VStack {
				Spacer()
				Spacer()
				Spacer()
				Spacer()
				Spacer()
				HStack(spacing:20) {
					Button {
						
					} label: {
						Text("Play")
							.foregroundColor(.white)
							.font(.title2)
							.fontWeight(.semibold)
							.frame(width: 140,height: 50)
							.overlay {
								RoundedRectangle(cornerRadius: 4)
									.stroke()
							}
					}
					
					Button {
						
					} label: {
						Text("Download")
							.foregroundColor(.white)
							.font(.title2)
							.fontWeight(.semibold)
							.frame(width: 140,height: 50)
							.overlay {
								RoundedRectangle(cornerRadius: 4)
									.stroke()
							}
					}
					
				}
				Spacer()
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	
	static let viewModel = HomeViewModel()
    static var previews: some View {
		NavigationStack {
			HomeView(viewModel:viewModel)
		}
    }
}
