//
//  NetworkClient.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

protocol NetworkClient {
    func get<T: Decodable>(url: String) async throws -> T
}
