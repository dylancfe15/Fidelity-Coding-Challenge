//
//  WelcomeScreen.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import SwiftUI

struct WelcomeScreen: View {

    // MARK: - Properties

    @State private var selectedPage = 0
    @State private var isListNavigationLinkActive = false
    @State private var backgroundOffsetY = 700

    // MARK: - Views

    var body: some View {
        NavigationStack {
            ZStack {
                Image(name: .welcome_background)
                    .resizable()
                    .frame(width: 600, height: 600)
                    .offset(CGSize(width: 0, height: backgroundOffsetY))

                VStack {
                    TabView(selection: $selectedPage) {
                        tabOne
                        tabTwo
                    }
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .tabViewStyle(PageTabViewStyle())
                        .onChange(of: selectedPage) { newValue in
                            withAnimation {
                                backgroundOffsetY = selectedPage == 0 ? 400 : 700
                            }
                        }

                    Spacer()
                }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
            }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding()
                .background(Color(name: .white_background_color))
                .navigationTitle("Fidelity Labs")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    NavigationLink(destination: ListScreen()) {
                        startButton
                    }
                        .opacity(selectedPage == 1 ? 1 : 0)
                }
                .onAppear {
                    withAnimation {
                        backgroundOffsetY = selectedPage == 0 ? 400 : 700
                    }
                }
        }
    }

    private var tabOne: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .fontWeight(.ultraLight)

            Text("Fidelity Coding Challenge")
                .fontWeight(.heavy)
        }
            .font(.system(size: 40))
            .tag(0)
    }

    private var tabTwo: some View {
        VStack(alignment: .leading) {
            Text("Dommy Title")
                .fontWeight(.heavy)
                .font(.system(size: 40))

            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,")
                .fontWeight(.ultraLight)

            Image(name: .shake_hand)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
            .tag(1)
    }

    private var startButton: some View {
        Text("Start")
            .fontWeight(.bold)
            .font(.system(size: 12))
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(height: 22)
            .background(Color.accentColor)
            .cornerRadius(11)
    }

    // MARK: - Functions

    private func floatingButtonOnClick() {
        isListNavigationLinkActive = true
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
