//
//  ContentView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var showOnboarding = false
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .marvelTabBar
    }
    var body: some View {
        TabView{
            coordinator.makeHomeView()
                .tabItem{
                    VStack{Text("HOME")
                        Image("avengers")
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit).font(.largeTitle)
                    }
                }
            coordinator.makeSearchView()
                .tabItem{
                    Label("SEARCH",systemImage: "magnifyingglass")
                }
            coordinator.makeFavouritesView()
                .tabItem{
                    Label(
                        title: { Text("FAVOURITES").bold() },
                        icon: { Image("ironman").renderingMode(.template).resizable().scaledToFit().scaleEffect().tint(.white.opacity(0.7))
                        }
                    ).padding()
                }
        }
        .tint(.red)
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return ContentView().environmentObject(coordinator)
}
