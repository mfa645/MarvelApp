//
//  MostPopularComicsView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

import SwiftUI
struct HorizontalItemsList<Item: Identifiable, Destination:View, ItemView:View>: View {
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
                LazyHStack(alignment: .top){
                    ForEach(items, id:\.id ) { item in
                        NavigationLink {
                            navigationDestination(item)
                        } label: {
                            itemView(item)
                                .tint(.marvelPrimary)
                        }                    }
                }
                .padding(.vertical)
            }
            .frame(height: 260)
            .scrollIndicators(.hidden)
        }
    }
}
#Preview {
    let coordinator = Coordinator(mock: false)
    
    return coordinator.makeHorizontalItemsList(items: [Character.example], navigationDestination:{ character in
        coordinator.makeCharacterDetailView(character: character)
    }, itemView: { character in
        VerticalItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
    })

}
