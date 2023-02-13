//
//  ListNetworkManager.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

final class ListNetworkManager: ListNetworkManaging {
    func getCryptocurrencies(completion: @escaping ([Cryptocurrency]) -> Void) {
        guard let baseURL = ConfigurationManager.shared.baseURL else { return }

        let urlString = "\(baseURL)/tickers"

        guard let url = URL(string: urlString) else { return }

        let urlRequest = URLRequest(url: url)

        request(urlRequest: urlRequest, responseType: [Cryptocurrency].self) { result in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
