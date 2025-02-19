//
//  ExtView+PrimaryButtonStyle.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//

import SwiftUI

extension View {
    func primaryButtonStyle(backgroundColor: Color = .blue, textColor: Color = .white) -> some View {
        self.buttonStyle(AnimatedPrimaryButtonStyle(backgroundColor: backgroundColor, textColor: textColor))
    }
}
