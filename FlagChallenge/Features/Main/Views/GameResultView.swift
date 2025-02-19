//
//  GameResultView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

struct GameResultView: View {
    
    let correctAnswers: Int
    let incorrectAnswers: Int
    let startGameAction: () -> ()
    
    var body: some View {
        VStack(spacing: 30) {
            Text(GameResultScreenConstants.gameResultTitle.rawValue)
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading) {

                answersInfo(text: "\(GameResultScreenConstants.gameCorrectAnswerTitle.rawValue) \(correctAnswers)")
                
                answersInfo(text: "\(GameResultScreenConstants.gameIncorrectAnswerTitle.rawValue) \(incorrectAnswers)")
            }
            
            Text(correctAnswers > incorrectAnswers ? GameResultScreenConstants.greatJobTitle.rawValue : GameResultScreenConstants.doBetterTitle.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
            
            Button(GameResultScreenConstants.restartButtonTitle.rawValue) {
                startGameAction()
            }
            .primaryButtonStyle(backgroundColor: .green)
        }
    }
    
    private func answersInfo(text: String) -> some View {
        Text(text)
            .font(.title2)
            .foregroundStyle(.black)
    }
}
