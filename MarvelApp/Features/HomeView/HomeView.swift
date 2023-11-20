//
//  HomeView.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        //TODO: BANNER CON EVENTOS
        
        //TODO: TITLE COMICS
        coordinator.makePopularItemsView(items: <#T##[Identifiable]#>, navigationDestination: <#T##(Identifiable) -> View#>, itemView: <#T##(Identifiable) -> View#>, onListAppendNeeded: <#T##(Int) -> Void#>)
        
        //TODO: TITLE SERIES
        coordinator.makePopularItemsView(items: <#T##[Identifiable]#>, navigationDestination: <#T##(Identifiable) -> View#>, itemView: <#T##(Identifiable) -> View#>, onListAppendNeeded: <#T##(Int) -> Void#>)
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeHomeView()
}
