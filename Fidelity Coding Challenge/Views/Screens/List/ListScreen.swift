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
    @Environment(\.managedObjectContext) var context

    // MARK: - Views

    var body: some View {
        VStack {
            List(viewModel.cryptocurrencies) { cryptocurrency in
                NavigationLink(destination: Text("Details")) {
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

                        Text(cryptocurrency.name ?? "N/A")
                    }
                }
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
