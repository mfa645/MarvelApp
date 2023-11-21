//
//  LabelExtensions.swift
//  MarvelApp
//
//  Created by user242581 on 21/11/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
