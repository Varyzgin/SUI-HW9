//
//  PostView.swift
//  SUI-HW9
//
//  Created by Dim on 29.08.2025.
//

import SwiftUI

struct PostView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        let scaleModifier: CGFloat = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
        
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                } label: {
                    Circle()
                        .foregroundStyle(Color.background)
                        .frame(width: 28 * scaleModifier, height: 28 * scaleModifier)
                        .overlay {
                            Image(.like)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16 * scaleModifier, height: 16 * scaleModifier)
                        }
                }
                .padding(6)
                HStack {
                    Image(.nike)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 114.98 * scaleModifier, height: 53.85 * scaleModifier)
                        .shadow(color: Color.shadow, radius: 16, y: 12)
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("BEST SELLER")
                        .font(.custom("Poppins-Regular", size: 12, relativeTo: .headline))
                        .lineLimit(1)
                        .foregroundStyle(.accent)
                    Text("Nike Air Max")
                        .font(.custom("RalewayRoman-Regular", size: 16, relativeTo: .title))
                        .lineLimit(2)
                        .fontWeight(.semibold)
                        .padding(.top, 8)

                    Text("₽752.00")
                        .font(.custom("Poppins-Medium", size: 14, relativeTo: .body))
                        .lineLimit(1)
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                        .padding(.bottom, 8)


                }
                .padding(.horizontal, 9)
                .padding(.top, 9)
                
                HStack { Spacer() } // гениальная конструкция-заполнитель, чтоб растянуть по максимуму по ширине
            }
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 70 * scaleModifier, height: 70 * scaleModifier)
                    .foregroundStyle(.accent)
                    .offset(x: 35 * scaleModifier, y: 35 * scaleModifier)
                    
                Image(.bin)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20 * scaleModifier, height: 20 * scaleModifier)
                    .offset(x: -7 * scaleModifier, y: -7 * scaleModifier)
                    
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        //        .padding(.horizontal, 0)
    }
}
