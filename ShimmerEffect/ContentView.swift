//
//  ContentView.swift
//  ShimmerEffect
//
//  Created by Lakshaya Sachdeva on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Shimmer Effect!")
                    .font(.title)
                    .fontWeight(.black)
                    .shimmer(ShimmerConfig(tint: .white.opacity(0.5), highlight: .white, blur: 5.0))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.red.gradient)
                    }
                HStack(spacing: 15) {
                    ForEach(["suit.heart.fill", "box.truck.badge.clock.fill", "camera", "house.fill"], id:\.self) { sfImage in
                        Image(systemName: sfImage)
                            .font(.title)
                            .fontWeight(.black)
                            .shimmer(ShimmerConfig(tint: .white.opacity(0.4), highlight: .white, blur: 5))
                            .frame(width: 40, height: 40)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(.indigo.gradient)
                            }
                        
                    }
                }
                
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                            .padding(.trailing, 50)
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                            .padding(.trailing, 100)
                        
                    }
                }
                .padding(15)
                .padding(.horizontal, 30)
                .shimmer(ShimmerConfig(tint: .gray.opacity(0.4), highlight: .white, blur: 5))
                
                
                HStack {
                    Rectangle()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                            .padding(.trailing, 50)
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                            .padding(.trailing, 100)
                        
                        RoundedRectangle(cornerRadius: 4.0)
                            .frame(height: 10)
                            .padding(.trailing, 150)
                        
                    }
                }
                .padding(15)
                .padding(.horizontal, 30)
                .shimmer(ShimmerConfig(tint: .gray.opacity(0.4), highlight: .white, blur: 5))
                
                HStack {
                    Rectangle()
                        .frame(height: 120)
                        .shimmer(ShimmerConfig(tint: .gray.opacity(0.4), highlight: .white.opacity(0.8), blur: 10))
                }
                .padding(.horizontal, 15)
                
            }
            .navigationTitle("Shimmer Effect")
            .preferredColorScheme(.dark)
        }
        
    }
}

#Preview {
    ContentView()
}
