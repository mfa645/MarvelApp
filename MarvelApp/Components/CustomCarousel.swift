//
//  CustomCarousel.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import SwiftUI

struct CustomCarousel<Content: View, Item, ID> : View where Item: RandomAccessCollection, ID: Hashable, ID: Equatable{
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element,ID>
    
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    init(index: Binding<Int>,items: Item, spacing: CGFloat = 30,cardPadding: CGFloat = 80, id: KeyPath<Item.Element, ID>, @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content){
        self.content = content
        self.id = id
        self._index = index
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
    }
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            LazyHStack(spacing:spacing){
                ForEach(items, id: id){item in
                    content(item, CGSize(width: cardWidth, height: size.height))
                        .frame(width: cardWidth, height: size.height)
                }
            }
            .padding(.horizontal, spacing)
        }
    }
}

#Preview {
    @State var currentIndex = 0
    let coordinator = Coordinator(mock: true)
    return CustomCarousel(index: $currentIndex, items: [Character.example], id: \.id) { character, cardSize in
        AsyncImage(
            url: URL(string: character.imageUrl)
        ){image in
            image.image?.resizable()
                .scaledToFill()
                .frame(width:cardSize.width, height: cardSize.height)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black, radius: 10)
        }
    }.environmentObject(coordinator)
}
