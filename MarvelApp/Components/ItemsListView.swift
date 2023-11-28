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
    let onListAppendNeeded: (Int) -> Void

    
    init(items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView, onListAppendNeeded: @escaping (Int)->Void){
        self.items = items
        self.navigationDestination = navigationDestination
        self.itemView = itemView
        self.onListAppendNeeded = onListAppendNeeded
    }
    
    var body: some View {
        List{
            ForEach(items, id: \.id ) { item in
                NavigationLink {
                    navigationDestination(item)
                } label: {
                    itemView(item)
                }.onAppear{
                    onListAppendNeeded(item.id.hashValue)
                }
            }.listRowBackground(Color(.marvelSecondary))
        }
        .listStyle(.plain)
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
   return ItemsListView(items: [Serie.example,.example,.example,.example,.example,.example,]) { serie in
        coordinator.makeSerieDetailView(serie: serie)
    } itemView: {serie in
        Text(serie.title)
    } onListAppendNeeded: {itemId in
        
    }
}
