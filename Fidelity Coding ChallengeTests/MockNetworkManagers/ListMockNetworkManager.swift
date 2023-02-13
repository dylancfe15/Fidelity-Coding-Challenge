//
//  ListMockNetworkManager.swift
//  Fidelity Coding ChallengeTests
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation
@testable import Fidelity_Coding_Challenge

final class ListMockNetworkManager: ListNetworkManaging {

    func getCryptocurrencies(completion: @escaping ([Fidelity_Coding_Challenge.Cryptocurrency]) -> Void) {
        guard let url = Bundle(for: ListViewModelTests.self).url(forResource: "list_response", withExtension: "json") else { return }

        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let response = try JSONDecoder().decode([Cryptocurrency].self, from: data)

            completion(response)
        } catch {
            completion([])
        }
    }
}
