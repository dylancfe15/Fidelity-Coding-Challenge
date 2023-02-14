//
//  DetailsScreen.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import SwiftUI

struct DetailsScreen: View {

    // MARK: - Properties

    @StateObject private var viewModel: DetailsViewModel

    // MARK: - Initializers

    init(viewModel: DetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Views

    var body: some View {
        VStack {
            List(viewModel.tweets, id: \.status_id) { tweet in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)

                        Text(tweet.user_name ?? "")
                            .bold()

                        Spacer()

                        Image(name: .twitter)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                    }

                    Text(tweet.status ?? "N/A")
                        .font(.system(size: 12))

                    if let likes = tweet.like_count {
                        Text("\(likes) Likes")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
            .onAppear {
                viewModel.getTweets()
            }
            .navigationTitle("\(viewModel.currency.name ?? "") Tweets")
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(viewModel: DetailsViewModel(currency: Cryptocurrency(id: "btc-bitcoin", name: "Bitcoin", symbol: nil, rank: nil, circulating_supply: nil, total_supply: nil, max_supply: nil, beta_value: nil, first_data_at: nil, last_updated: nil, quotes: nil)))
    }
}
