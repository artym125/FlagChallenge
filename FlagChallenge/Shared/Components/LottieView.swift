//
//  LottieView.swift
//  FlagChallenge
//
//  Created by Ostap Artym on 19.02.2025.
//


import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationView = LottieAnimationView()
    var filename = "CountryAnimation"
    var loopMode: LottieLoopMode
    var animationSpeed: CGFloat
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView()
        
        let animation = LottieAnimation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
