//
//  PopularItemView.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import SwiftUI

struct PopularItemView: View {
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
            }
            
            Text(title)
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.center)
                .font(.headline).padding(.top)
            Spacer()
        }
        .frame(width: 200,height: 200)
        .padding()
    }
}

#Preview {
    let serie = Serie.example
    let comic = Comic.example
    let character = Character.example
    return ScrollView(.horizontal){
        HStack{
            PopularItemView(title: serie.title, imageUrl: serie.imageUrl, rounded: false)
            PopularItemView(title: comic.title, imageUrl: "https://i.annihil.us/u/prod/marvel/i/mg/9/20/4bc665483c3aa.jpg", rounded: false)
            PopularItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
        }
    }
}
