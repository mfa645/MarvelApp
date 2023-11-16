//
//  PopularSerieItemView.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import SwiftUI

struct PopularSerieItemView: View {
    let serie : Serie
    var body: some View {
        VStack{
            AsyncImage(
                url: URL(string: serie.imageUrl)
            ){image in
                image.image?.resizable().scaledToFill()
            }.frame(width: 100,height: 100)
            Text(serie.title)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .font(.headline)
            
        }
        .frame(width: 150)
        .padding()
    }
}

#Preview {
    PopularSerieItemView(serie: .example)
}
