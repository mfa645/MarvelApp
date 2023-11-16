//
//  MostPopularSeriesView.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
import SwiftUI
struct MostPopularSeriesView: View {
    @EnvironmentObject var coordinator: Coordinator
    let series: [Serie]
    init(series: [Serie]) {
        self.series = series
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(series) { serie in
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
                                .frame(width: 150)
                        }
                        .padding()
                    }
                }
            }
        }.frame(height: )
    }
}

#Preview {
    MostPopularSeriesView(series: [.example])
}
