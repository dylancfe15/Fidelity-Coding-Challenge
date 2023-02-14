//
//  ListScreen.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import SwiftUI

struct ListScreen: View {

    // MARK: - Properties

    @StateObject private var viewModel = ListViewModel()

    // MARK: - Views

    var body: some View {
        VStack {
            List(viewModel.cryptocurrencies) { cryptocurrency in
                NavigationLink(destination: DetailsScreen(viewModel: DetailsViewModel(currency: cryptocurrency))) {
                    HStack {
                        Button {
                            viewModel.favoriteButtonAction(for: cryptocurrency.id)
                        } label: {
                            Image(systemName: viewModel.isCryptocurrenceFavorite(id: cryptocurrency.id) ? "star.fill" : "star")
                                .resizable()
                                .font(.system(size: 15))
                                .foregroundColor(.yellow)
                        }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 30, height: 30)

                        VStack(alignment: .leading) {
                            if let name = cryptocurrency.name {
                                Text(name)
                                    .bold()
                            }

                            if let price = cryptocurrency.quotes?.USD?.price {
                                Text("$\(price)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
                .refreshable {
                    viewModel.getCryptocurrencies()
                }
        }
            .onAppear {
                viewModel.getCryptocurrencies()
            }
            .navigationTitle("List")
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
