//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import Foundation
import SwiftUI

struct NavBarView: View {
    @Environment(\.sizeCategory) var sizeCategory // для нормального обновления scaleModifier
    @Binding var navBarBottom: CGFloat
    
    var body: some View {
        // { x^2 + y^2 = (44/2)^2 - окружность }
        // { x = y - прямая                    }
        // x = sqrt(44^2 / 2^3)
        let scaleModifier: CGFloat = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
        let bagMarkPosition: CGFloat = sqrt(pow(44 * scaleModifier, 2) / pow(2,3))
        
        VStack(spacing: 0) {
            ZStack {
                Text("Главная")
                    .lineLimit(1)
                    .font(.custom("RalewayRoman-Regular", size: 32, relativeTo: .largeTitle))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 100)
                HStack {
                    Button {
                        //
                    } label: {
                        Image(.more)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25.71 * scaleModifier, height: 25.71 * scaleModifier)
                    }
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        ZStack {
                            GeometryReader { proxy in
                                Circle()
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 44 * scaleModifier, height: 44 * scaleModifier)
                            
                            Image(.bag)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24 * scaleModifier, height: 24 * scaleModifier)
                            Circle()
                                .foregroundStyle(.marked)
                                .frame(width: 8 * scaleModifier, height: 8 * scaleModifier)
                                .offset(x: bagMarkPosition, y: -bagMarkPosition)
                        }
                    }
                }
            }
            .padding(.horizontal, Margins.M / scaleModifier)
            .padding(.bottom, Margins.S / scaleModifier)
            .background(Color.background)
            GeometryReader { geo in
                Color.clear
                    .onChange(of: geo.frame(in: .global).maxY) { _, new in
                        navBarBottom = new
                    }
                    .onAppear {
                        navBarBottom = geo.frame(in: .global).maxY
                    }
            }
            .frame(height: 0)
        }
    }
}
