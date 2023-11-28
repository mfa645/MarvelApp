//
//  SerieDetailView.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import SwiftUI

struct SerieDetailView: View {
    let serie :Serie
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:0){
                    ZStack(alignment: .bottom){
                            AsyncImage(
                                url: URL(string: serie.imageUrl)
                            ){image in
                                image.image?.resizable()
                                    .scaledToFill()
                                    .overlay(.black.opacity(0.1))
                            }
                        HStack{
                            Spacer()
                            Text(serie.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                                .foregroundColor(.marvelPrimary.opacity(0.7))
                            Spacer()
                        }
                        .background(Color.marvelTertiary.opacity(0.80))
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(edges: .horizontal)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeSerieDetailView(serie: .example).environmentObject(coordinator)}
