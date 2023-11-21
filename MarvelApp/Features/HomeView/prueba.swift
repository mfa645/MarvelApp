//
//  prueba.swift
//  MarvelApp
//
//  Created by user242581 on 21/11/23.
//

import SwiftUI

struct prueba: View {
    let coordinator = Coordinator(mock: true)
    var body: some View {
        coordinator.makePopularItemsView(items: [Serie.example], navigationDestination: {serie in
            coordinator.makeSerieDetailView(serie: serie)}, itemView:{serie in
                coordinator.makePopularItemView(title: serie.title, imageUrl: serie.imageUrl)
            } )
    }
}

#Preview {
    prueba()
}
