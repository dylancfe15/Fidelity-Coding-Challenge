//
//  DetailsNetworkManager.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

final class DetailsNetworkManager: DetailsNetworkManaging {

    func getTweets(for id: String, completion: @escaping ([Tweet]) -> Void) {
        guard let baseURL = ConfigurationManager.shared.baseURL else { return }

        let urlString = "\(baseURL)/coins/\(id)/twitter"

        guard let url = URL(string: urlString) else { return }

        let urlRequest = URLRequest(url: url)

        request(urlRequest: urlRequest, responseType: [Tweet].self) { result in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
