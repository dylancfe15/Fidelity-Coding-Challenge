//
//  DetailsMockNetworkManager.swift
//  Fidelity Coding ChallengeTests
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation
@testable import Fidelity_Coding_Challenge

final class DetailsMockNetworkManager: DetailsNetworkManaging {

    func getTweets(for id: String, completion: @escaping ([Fidelity_Coding_Challenge.Tweet]) -> Void) {
        guard let url = Bundle(for: ListViewModelTests.self).url(forResource: "tweets_response", withExtension: "json") else { return }

        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let response = try JSONDecoder().decode([Tweet].self, from: data)

            completion(response)
        } catch {
            completion([])
        }
    }
}
