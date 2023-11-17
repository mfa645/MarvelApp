//
//  CustomPicker.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

struct CustomSegmentedPicker<T: CaseIterable & Hashable> : View where T.AllCases: RandomAccessCollection {
    public let sourcesEnum:T.Type
    public let selection: Binding<String>
    var body: some View {
        Picker("", selection: selection) {
            ForEach(sourcesEnum.allCases, id:\.self){source in
                Text(String(describing: source).uppercased()).tag(String(describing: source))
                    .background(.red)
            }
        }
        .pickerStyle(.segmented)
    }
    init(sourcesEnum : T.Type, selection: Binding<String>){
        self.sourcesEnum = sourcesEnum
        self.selection = selection
        
        UISegmentedControl.appearance().backgroundColor = .marvelSecondary
        UISegmentedControl.appearance().selectedSegmentTintColor = .marvelRed
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font : UIFont.preferredFont(forTextStyle: .body)], for: .selected)

        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.marvelPrimary, .font : UIFont.preferredFont(forTextStyle: .body)], for: .normal)
        
    }
}



#Preview {
    CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: .constant(SearchTypeFilters.characters.rawValue))
}
