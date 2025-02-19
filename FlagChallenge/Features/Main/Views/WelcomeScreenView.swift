//
//  WelcomeScreenView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//


import SwiftUI

struct WelcomeScreenView: View {
    let startGameAction: () -> Void
    
    var body: some View {
        VStack {
            
            LottieView(loopMode: .loop, animationSpeed: 1)
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 300)
            
            Text(WelcomeScreenConstants.welcomeText.rawValue)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(WelcomeScreenConstants.startButtonTitle.rawValue) {
                startGameAction()
            }
            .primaryButtonStyle(backgroundColor: .green)
            
            Spacer()
        }
    }
}