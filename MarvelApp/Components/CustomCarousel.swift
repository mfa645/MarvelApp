//
//  CustomCarousel.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import SwiftUI

struct CustomCarousel<Content: View, Item/*ID*/> : View where Item: RandomAccessCollection, Item.Element: Identifiable, Item.Element: Equatable /*ID: Equatable*/{
    var content: (Item.Element, CGSize) -> Content
    //var id: KeyPath<Item.Element,ID>
    
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    init(index: Binding<Int>,items: Item, spacing: CGFloat = 30,cardPadding: CGFloat = 80, /*id: KeyPath<Item.Element, ID>,*/ @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content){
        self.content = content
        //self.id = id
        self._index = index
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
    }
    @GestureState var translation: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastStoredOffset : CGFloat = 0
    
    @State var currentIndex: Int = 0
    @State var rotation: Double = 0
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            LazyHStack(spacing:spacing){
                ForEach(items, id:\.id ){item in
                    let index = indexOf(item: item)
                    content(item, CGSize(width: size.width - cardPadding, height: size.height))
                        .rotationEffect(.init(degrees: Double(index)*5), anchor: .bottom)
                        .rotationEffect(.init(degrees: rotation), anchor: .bottom)
                        .offset(y: offSetCardY(index: index, cardWidth: cardWidth))
                        .frame(width: size.width - cardPadding, height: size.height)
                        .contentShape(Rectangle())
                }
            }
            .padding(.horizontal, spacing)
            .offset(x:limitScroll())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: {value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged{onChanged(value: $0, cardWidth: cardWidth)}
                    .onEnded{onEnded(value: $0, cardWidth: cardWidth)}
            )
            
        }.onAppear{
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lastStoredOffset = extraSpace
        }
        .animation(.easeInOut, value: translation == 0)
    }
    func offSetCardY(index: Int, cardWidth: CGFloat)->CGFloat{
        let progress = ((translation < 0 ? translation : -translation) / cardWidth ) * 60
        let yOffset = -progress < 60 ? progress : -(progress + 120)
        
        let previous = (index - 1) == self.index ? (translation < 0 ? -yOffset : yOffset) : 0
        let next = (index + 1) == self.index ? (translation < 0 ? -yOffset :  yOffset) : 0
        let inCenter = (index - 1) == self.index ? previous : next
        return  index == self.index ? -60 - yOffset : inCenter
    }
    
    func indexOf(item: Item.Element)->Int{
        let array = Array(items)
        if let index = array.firstIndex(of: item){
            return index
        }
        return 0
    }
    
    func limitScroll()->CGFloat{
        let extraSpace = (cardPadding / 2) - spacing
        if index == 0 && offset > extraSpace{
            return extraSpace + (offset / 4)
        }else if index == items.count - 1 && translation < 0{
            return offset - (translation/2)
        }else{
            return offset
        }
    }
    
    func onChanged(value: DragGesture.Value, cardWidth: CGFloat){
        let translationX = value.translation.width
        offset = translationX + lastStoredOffset
        
        let progress = offset / cardWidth
        rotation = (progress * 5).rounded() - 1
    }
    func onEnded(value: DragGesture.Value, cardWidth: CGFloat){
        var index = (offset/cardWidth).rounded()
        index = max(-CGFloat(items.count - 1), index)
        index = (min(index,0))
        
        currentIndex = Int(index)
        self.index = -currentIndex
        withAnimation (.easeInOut(duration: 0.25)) {
            let extraSpace = (cardPadding / 2) - spacing
            offset = (cardWidth * index) + extraSpace
        }
        
        lastStoredOffset = offset
    }
}

#Preview {
    @State var currentIndex = 0
    let coordinator = Coordinator(mock: true)
    return CustomCarousel(index: $currentIndex, items: [Character.example]) { character, cardSize in
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
