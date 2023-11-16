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
                    }
                }
            }
        }
    }
}

#Preview {
    MostPopularSeriesView(series: [.example])
}
