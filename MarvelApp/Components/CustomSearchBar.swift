//
//  CustomSearchBar.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import SwiftUI


struct CustomSearchBar: View {
    @Binding var searchFilter: String
    @State var active = false
    let searchPlaceholder : String
    let onCancelClicked : ()->Void
    
    var body: some View {
        HStack() {
            Spacer()
            HStack {
                
                Image(systemName: "magnifyingglass").foregroundColor(.marvelOnTertiary)
                TextField(searchPlaceholder, text: $searchFilter, onEditingChanged: { editing in
                    withAnimation {
                        active = editing
                    }
                })
                .frame(height: 28)
                .tint(.red)
                .foregroundStyle(.marvelOnTertiary)
            }
            .padding(7)
            .background(.marvelTertiary)
            
            Button("Cancel") {
                withAnimation {
                    active = false
                }
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                onCancelClicked()
            }
            .frame(width: active ? nil : 0)
            .foregroundStyle(.marvelOnTertiary)
        }.frame(height: 28)
    }
}

#Preview {
    CustomSearchBar(searchFilter: .constant(""), searchPlaceholder: "Search all characters", onCancelClicked: {})
}
