//
//  TextFieldObserver.swift
//  MarvelApp
//
//  Created by user242581 on 21/11/23.
//

import Foundation
import Combine

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] text in
                self?.debouncedText = text
            } )
            .store(in: &subscriptions)
    }
}
