//
//  GameVM.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//


import SwiftUI
import Combine

class GameViewModel: GameViewModelProtocol {
    
    @Published var countries: [Country] = []
    @Published var currentRound = 0
    @Published var correctAnswers = 0
    @Published var incorrectAnswers = 0
    @Published var currentQuestion: Country?
    @Published var options: [String] = []
    @Published var showMessage = false
    @Published var messageText = ""
    @Published var isGameOver = false
    @Published var messageOffset = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadCountries()
        
        $showMessage
            .sink { [weak self] newValue in
                self?.updateMessageOffset(newValue)
            }
            .store(in: &cancellables)
    }
    
    private func loadCountries() {
        Future<[Country], Never> { promise in
            DispatchQueue.global().async {
                guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
                      let data = try? Data(contentsOf: url),
                      let countries = try? JSONDecoder().decode([Country].self, from: data)
                else {
                    print("Failed to load or parse countries.json file")
                    promise(.success([]))
                    return
                }
                promise(.success(countries))
            }
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] loadedCountries in
            self?.countries = loadedCountries
        }
        .store(in: &cancellables)
    }
    
    func startGame() {
        correctAnswers = 0
        incorrectAnswers = 0
        currentRound = 0
        isGameOver = false
        nextQuestion()
    }
    
    func nextQuestion() {
        guard !countries.isEmpty else { return }
        guard currentRound < GameConfig.maxRounds else {
            isGameOver = true
            return
        }
        currentRound += 1
        
        if let question = countries.randomElement() {
            currentQuestion = question
            var optionsSet = Set<String>()
            optionsSet.insert(question.name)
            while optionsSet.count < 2 {
                if let randomOption = countries.randomElement()?.name {
                    optionsSet.insert(randomOption)
                }
            }
            options = optionsSet.shuffled()
        }
    }
    
    func checkAnswer(_ answer: String) {
        if answer == currentQuestion?.name {
            correctAnswers += 1
            messageText = GameScreenConstants.successMessage.rawValue
        } else {
            incorrectAnswers += 1
            messageText = GameScreenConstants.failureMessage.rawValue
        }
        showMessage = true
        
        Just(())
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] in
                self?.showMessage = false
                self?.nextQuestion()
            }
            .store(in: &cancellables)
    }
    
    func updateMessageOffset(_ showMessage: Bool) {
        withAnimation {
            messageOffset = showMessage ? 0 : 200
        }
    }
}
