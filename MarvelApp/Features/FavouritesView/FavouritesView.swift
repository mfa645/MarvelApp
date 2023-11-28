//
//  FavouritesView.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: FavouritesViewModel
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    private let characters : [Character] = [.init(
        id: 2,
        name: "A-Bomb (HAS)",
        thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16","extension" : "jpg"],
        description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! "
        
    ),
                                            .init(
                                                id: 3,
                                                name: "A.I.M.",
                                                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec","extension" : "jpg"],
                                                description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! "
                                                
                                            ),
                                            .init(
                                                id: 4,
                                                name: "Aaron Stack",
                                                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"],
                                                description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! "
                                                
                                            )]
    
    init(viewModel: FavouritesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                if(!characters.isEmpty){
                    CustomCarousel(index: $currentIndex, items: characters,cardPadding: 150, id: \.id) { character, cardSize in
                        AsyncImage(
                            url: URL(string: character.imageUrl)
                        ){image in
                            image.image?.resizable()
                                .scaledToFill()
                                .frame(width:cardSize.width, height: cardSize.height)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: .marvelTertiary, radius: 10)//10:30
                        }
                    }
            } else {
                Text("No favourite characters added yet !")
            }
            }.frame(height: 500)
        .onAppear{
            viewModel.getCharacters()
        }
    }
}
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeFavouritesView().environmentObject(coordinator)}
