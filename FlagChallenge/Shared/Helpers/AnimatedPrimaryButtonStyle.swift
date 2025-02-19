//
//  AnimatedPrimaryButtonStyle.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

struct AnimatedPrimaryButtonStyle: ButtonStyle {
    var backgroundColor: Color = .blue
    var textColor: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(textColor)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(backgroundColor)
            )
            .padding(.horizontal)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


