//
//  GameQuestionView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

struct GameQuestionView: View {
    let question: Country
    let currentRound: Int
    let maxRounds: Int
    let options: [String]
    let checkAnswer: (String) -> Void

    @State private var selectedAnswer: String? = nil
    @State private var answerIsCorrect: Bool? = nil

    var body: some View {
        VStack {
            
            Text("\(currentRound)/\(maxRounds)")
                .font(.title3)
                .foregroundColor(.black)
                .padding(.top)
            
            Spacer()
            
            Text(question.flag)
                .font(.system(size: 200))
            
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selectedAnswer = option
                    answerIsCorrect = option == question.name
                    checkAnswer(option)
                }
                .primaryButtonStyle(
                    backgroundColor: backgroundColor(for: option),
                    textColor: textColor(for: option)
                )
            }
            
            Spacer()
        }
    }
    
    private func backgroundColor(for option: String) -> Color {
        if let selected = selectedAnswer, selected == option {
            return (answerIsCorrect ?? false) ? .green : .red
        }
        return .blue.opacity(0.2)
    }
    
    private func textColor(for option: String) -> Color {
        if let selected = selectedAnswer, selected == option {
            return .white
        }
        return .black
    }
}
