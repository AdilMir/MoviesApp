//
//  Tab.swift
//  IMDB API
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI
enum TabViewItems: Int {
	case home = 0
	case upcomming
}

struct Tab: View {
	@State var selection = TabViewItems.home
	@StateObject var viewModel = HomeViewModel()
	@State var navigationTitle: String = "Home"
	
	var body: some View {
		TabView(selection: $selection) {
			HomeView(viewModel: viewModel)
				.tabItem {
					Label("Home", systemImage: "house")
						.onTapGesture {
							//getTitle()
						}
				}
				.tag(TabViewItems.home)
			
			
			UpcomingView(viewModel: viewModel)
				.tabItem {
					Label("Home", systemImage: "play.circle")
						.onTapGesture {
							//getTitle()
						}
				}
				.tag(TabViewItems.home)
		}
		.tint(.white)
		
	}
}


struct Tab_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack{
			Tab()
		}
    }
}
