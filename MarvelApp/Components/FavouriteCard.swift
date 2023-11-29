//
//  FavouriteCard.swift
//  MarvelApp
//
//  Created by user242581 on 29/11/23.
//

import SwiftUI

struct FavouriteCard: View {
    let character: Character
    let cardSize: CGSize
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                AsyncImage(
                    url: URL(string: character.imageUrl)
                ){image in
                    image.image?.resizable()
                        .scaledToFill()
                        .frame(width:cardSize.width, height: cardSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.black.opacity(0.5), lineWidth: 5))
                        .shadow(color: .marvelTertiary, radius: 10)
                }
            }
            Text(character.name)
                .foregroundStyle(.marvelPrimary.opacity(0.7))
                .bold()
        }    }
}

#Preview {
    FavouriteCard(character: .example, cardSize:CGSize(width: 300, height: 500))
}
