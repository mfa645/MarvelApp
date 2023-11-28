//
//  HeaderView.swift
//  MarvelApp
//
//  Created by user242581 on 27/11/23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var coordinator: Coordinator
    let text : String
    var body: some View {
        HStack {
            Text(text)
                .font(.headline)
                .foregroundStyle(.marvelPrimary)
                .bold()
            Spacer()
            NavigationLink {
                switch(text){
                case "COMICS" :coordinator.makeSearchView(toolBarVisible: true, selected: SearchTypeFilters.comics.rawValue)
                case "SERIES": coordinator.makeSearchView(toolBarVisible: true, selected:SearchTypeFilters.series.rawValue)
                case "CHARACTERS": coordinator.makeSearchView(toolBarVisible: true, selected:SearchTypeFilters.characters.rawValue)
                default:
                    coordinator.makeSearchView(toolBarVisible: true, selected: SearchTypeFilters.characters.rawValue)
                }
            } label: {
                Label(
                    title: { Text("VIEW ALL").font(.subheadline) },
                    icon: { Image(systemName: "chevron.right.2").foregroundStyle(.marvelRed).font(.footnote) }
                )
                .labelStyle(TrailingIconLabelStyle())
                .bold()
            }.foregroundStyle(.marvelPrimary)
        }
        .padding()
        .background(.marvelSecondary)    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return HeaderView(text: "SERIES").environmentObject(coordinator)
    
}
