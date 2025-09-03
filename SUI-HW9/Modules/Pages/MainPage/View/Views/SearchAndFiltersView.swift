//
//  SearchAndFiltersView.swift
//  SUI-HW9
//
//  Created by Dim on 29.08.2025.
//

import SwiftUI

struct SearchAndFiltersView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State var searchingText: String = ""
    @FocusState var focusOnSearchBar: Bool
    
    var body: some View {
        let scaleModifier: CGFloat = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: 52 * scaleModifier)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    .onTapGesture {
                        focusOnSearchBar = true
                    }
                HStack {
                    Image(.search)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14.33 * scaleModifier, height: 14.33 * scaleModifier)
                        .allowsHitTesting(false)
                    ZStack {
                        if searchingText.isEmpty {
                            Text("Поиск")
                                .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                                .lineLimit(1)
                                .foregroundStyle(.darkGrey)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .allowsHitTesting(false)
                        }
                        TextField("", text: $searchingText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom("Poppins-Medium", size: 12, relativeTo: .body))
                            .focused($focusOnSearchBar)
                    }.frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)
            }

            Button {
                
            } label: {
                Circle()
                    .frame(height: 52 * scaleModifier)
                    .foregroundStyle(.accent)
                    .overlay {
                        Image(.filters)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24 * scaleModifier, height: 24 * scaleModifier)
                    }
            }
        }
    }
}
