//
//  ItemsListView.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import SwiftUI

struct ItemsListView<Item: Identifiable, Destination:View, ItemView:View>: View  {
    let items: [Item]
    let navigationDestination: (Item) -> Destination
    let itemView : (Item) -> ItemView
    
    init(items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView){
        self.items = items
        self.navigationDestination = navigationDestination
        self.itemView = itemView
    }
    
    var body: some View {
        List{
            ForEach(items, id: \.id ) { item in
                NavigationLink {
                    navigationDestination(item)
                } label: {
                    itemView(item)
                }
            }.listRowBackground(Color(.marvelSecondary))
        }
        .listStyle(.plain)
    }
}

#Preview {
    ItemsListView(items: [Serie.example,.example,.example,.example,.example,.example,]) { serie in
        SerieDetailView(serie: serie)
    } itemView: {serie in
        Text(serie.title)
    }
}
