//
//  GameVMProtocol.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

protocol GameViewModelProtocol: ObservableObject {
    var countries: [Country] { get }
    var currentRound: Int { get }
    var correctAnswers: Int { get }
    var incorrectAnswers: Int { get }
    var currentQuestion: Country? { get }
    var options: [String] { get }
    var showMessage: Bool { get }
    var messageText: String { get }
    var isGameOver: Bool { get }
    var messageOffset: Int { get }
    
    func startGame()
    func nextQuestion()
    func checkAnswer(_ answer: String)
}
