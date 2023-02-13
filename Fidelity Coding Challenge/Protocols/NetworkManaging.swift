//
//  NetworkManaging.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

protocol NetworkManaging {
    func request<T: Decodable>(urlRequest: URLRequest, responseType: T.Type, completion: @escaping(_ result: Result<T, Error>) -> Void)
}
