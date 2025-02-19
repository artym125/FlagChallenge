//
//  RootView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        MainView(viewModel: viewModel)
    }
}
