//
//  HomeView.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing:0){
                    TabView {
                        ForEach(viewModel.events) { lastEvent in
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: lastEvent.imageUrl)){image in
                                    image.image?.resizable()
                                        .frame(height:300)
                                        .scaledToFit()
                                        .clipped()
                                        .overlay(Color.black.opacity(0.4))
                                }
                                .clipped()
                                HStack {
                                    Spacer()
                                    Text(lastEvent.title)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                    Spacer()
                                }.background(Color.black.opacity(0.7))
                            }
                        }
                    }
                    .frame(height: 400)
                    .tabViewStyle(PageTabViewStyle())
                    
                    Text("Comics").padding(.leading)
                    Text("Series").padding(.leading)
                        
                        
                }
                .task{
                    await viewModel.getEvents()
                }
            }
        }
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeHomeView()
}

