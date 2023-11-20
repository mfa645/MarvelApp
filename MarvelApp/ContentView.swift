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
    }
    var body: some View {
        TabView{
            coordinator.makeHomeView()
                .tabItem{
                    Label("Home",systemImage: "house.fill")
                }
            
            coordinator.makeSearchView()
                .tabItem{
                    Label("Search",systemImage: "magnifyingglass")
                }
        }
        .tint(.red)
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return ContentView().environmentObject(coordinator)
}
