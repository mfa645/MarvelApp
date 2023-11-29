//
//  PopularItemView.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import SwiftUI

struct VerticalItemView: View {
    let title : String
    let imageUrl: String
    var rounded : Bool
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(
                url: URL(string: imageUrl)
            ){image in
                image.image?.resizable().scaledToFill().clipped()   }
            .frame(maxWidth: 120,maxHeight: 180)
            .if(rounded){view in
                view.clipShape(.circle)
                    .frame(maxHeight:120)
            }
            
            Text(title)
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.center)
                .font(.headline).padding(.top)
                .if(rounded) { view in
                    view.frame(width: 110)
                }
            Spacer()
        }
        .frame(width: 200,height: 200)
        .if(rounded) { view in
            view.frame(width: 120)
        }
        .padding()
    }
}

#Preview {
    let serie = Serie.example
    let comic = Comic.example
    let character = Character.example
    return ScrollView(.horizontal){
        HStack{
            VerticalItemView(title: serie.title, imageUrl: serie.imageUrl, rounded: false)
            VerticalItemView(title: comic.title, imageUrl: "https://i.annihil.us/u/prod/marvel/i/mg/9/20/4bc665483c3aa.jpg", rounded: false)
            VerticalItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
            VerticalItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
            VerticalItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
        }
    }.scrollIndicators(.hidden)
}
