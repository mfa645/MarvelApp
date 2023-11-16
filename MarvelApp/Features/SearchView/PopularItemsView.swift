//
//  MostPopularComicsView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

import SwiftUI
struct PopularItemsView<Item: Identifiable, Destination:View, ItemView:View>: View {
    let items: [Item]
    let navigationDestination: (Item) -> Destination
    let itemView: (Item) -> ItemView
    
    init(items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView){
        self.items = items
        self.navigationDestination = navigationDestination
        self.itemView = itemView
    }
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(items) { item in
                        NavigationLink {
                            navigationDestination(item)
                        } label: {
                            itemView(item)
                                .tint(.marvelPrimary)
                        }
                        
                    }
                }
                .frame(height: 200)
                .padding(.bottom)
            }
        }
    }
}
#Preview {
    PopularItemsView(items: [Serie.example]) { serie in
        SerieDetailView(serie: serie)
    } itemView: { serie in
        PopularItemView(title: serie.title, imageUrl: serie.imageUrl)
    }
    
}