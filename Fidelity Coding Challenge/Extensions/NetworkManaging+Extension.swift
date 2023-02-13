//
//  NetworkManaging+Extension.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

extension NetworkManaging {

    func request<T: Decodable>(urlRequest: URLRequest, responseType: T.Type, completion: @escaping(_ result: Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data,
                  let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(error ?? NetworkError.unknownError))
                return
            }

            completion(.success(decodedResponse))
        }
            .resume()
    }
}
