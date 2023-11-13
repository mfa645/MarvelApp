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
    var body: some View {
        TabView{
            coordinator.makeSearchView()
                .tabItem{
                    Label("Search",systemImage: "magnifyingglass")
                }
        }
    }
}
#Preview {
    ContentView()
}
