//
//  SplashScreenView.swift
//  MarvelApp
//
//  Created by user242581 on 29/11/23.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isActive : Bool
    @State private var iconSize = 0.7
    @State private var iconOpacity = 0.5
    var body: some View {
        VStack{
            VStack{
                Image("marvelSplashLogo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(iconSize)
                    .opacity(iconOpacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.iconSize = 0.9
                            self.iconOpacity = 1.0
                        }
                    }
            }
            .frame(maxWidth:.infinity, maxHeight:.infinity)
            .background(
                Image("marvelSplashWallpaper")
                    .resizable()
                    .scaledToFill()
            )
            .ignoresSafeArea()
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0){
                self.isActive = false
            }
        }
    }
}
#Preview {
    SplashScreenView(isActive: .constant(true))
}
