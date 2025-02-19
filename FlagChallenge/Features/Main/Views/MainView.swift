//
//  MainView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

struct MainView<ViewModel: GameViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            VStack {
                if viewModel.isGameOver {
                    GameResultView(
                        correctAnswers: viewModel.correctAnswers,
                        incorrectAnswers: viewModel.incorrectAnswers,
                        startGameAction: viewModel.startGame
                    )
                } else if let question = viewModel.currentQuestion {
                    
                    GameQuestionView(question: question,
                                     currentRound: viewModel.currentRound,
                                     maxRounds: GameConfig.maxRounds,
                                     options: viewModel.options,
                                     checkAnswer: viewModel.checkAnswer
                    )
                    .disabled(viewModel.showMessage)
                    
                } else {
                    WelcomeScreenView(startGameAction: viewModel.startGame)
                }
            }
            
            VStack {
                Spacer()
                
                messageView
                    .offset(y: CGFloat(viewModel.messageOffset))
            }
        }
    }
    
    private var messageView: some View {
        Text(viewModel.messageText)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
    }
}
