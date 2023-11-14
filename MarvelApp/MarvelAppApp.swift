//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

@main
struct MarvelAppApp: App {
    let coordinator = Coordinator(mock: true)
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(coordinator)
        }
    }
}
