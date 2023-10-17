//
//  ShimmerEffect.swift
//  ShimmerEffect
//
//  Created by Lakshaya Sachdeva on 17/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func shimmer(_ config: ShimmerConfig) -> some View{
        self
            .modifier(ShimmerEffectHelper(config: config))
    }
}

fileprivate struct ShimmerEffectHelper: ViewModifier {
    // shimmer config
    var config: ShimmerConfig
    // Animation properties
    @State private var moveTo: CGFloat = -0.7
    
    func body(content: Content) -> some View {
        content
        // adding shimmer animation with the help of masking
        // hiding the normal one and adding the shimmer one
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask{
                        content
                    }
                // shimmer effect
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = size.height/2.5
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                    // gradient for glowing at the center
                                        .fill(
                                            .linearGradient(colors: [.white.opacity(0),
                                                                     config.highlight.opacity(config.highlightOpacity),
                                                                     .white.opacity(0)], startPoint: .top, endPoint: .bottom)
                                        
                                        )
                                    // Adding blur
                                        .blur(radius: config.blur)
                                    // Rotating degree
                                        .rotationEffect(.init(degrees: -70))
                                    // moving to the start
                                        .offset(x: moveTo < 0 ? extraOffset : -extraOffset)
                                        .offset(x: size.width * moveTo)

                                }
                        }
                        
                        // mask with the content
                        .mask {
                            content
                        }
                        
                    }
                // Animating movement
                    .onAppear{
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}

struct ShimmerConfig{
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 2
}


#Preview {
    ContentView()
}
