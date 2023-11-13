//
//  APIResponse.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let data: DataResponse<T>
}

struct DataResponse<T: Decodable>: Decodable {
    let results: [T]
}
