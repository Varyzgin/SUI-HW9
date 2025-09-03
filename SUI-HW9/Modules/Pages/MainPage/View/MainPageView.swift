//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

enum Categories: String, CaseIterable {
    case Все, Outdoor, Tennis, Другие, Nike, Adidas
}

struct MainPageView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State var searchingText: String = ""
    @FocusState var focusOnSearchBar: Bool
    @State var selectedCategory: Categories?
    @State var topOfFeeds: CGFloat = 0
    
    var body: some View {
        let scaleModifier: CGFloat = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
        
        ZStack(alignment: .top){
            VStack(alignment: .leading, spacing: 0) {
                SearchAndFiltersView()
                    .padding(.horizontal, Margins.M)
                
                Text("Категории")
                    .font(.custom("RalewayRoman-Regular", size: 16, relativeTo: .title))
                    .fontWeight(.semibold)
                    .frame(alignment: .leading)
                    .padding(.horizontal, Margins.M)
                    .padding(.top, 24)
                    .padding(.bottom, 14)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(Categories.allCases, id: \.self) { category in
                            Button {
                                self.selectedCategory = category
                                print(category)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(.white)
                                        .frame(width: 108 * scaleModifier, height: 40 * scaleModifier)
                                    Text(category.rawValue)
                                        .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
                                        .padding(.vertical, 11)
                                }
                            }
                            .tint(.darkGrey)
                        }
                    }
                    .padding(.horizontal, Margins.M)
                }
                .padding(.bottom, 14)
                GeometryReader { geo in
                    Color.red.onAppear {
                        print(geo.frame(in: .global).minY)
                    }
                }
                .frame(height: 1)
            }
            .background(Color.background)
            .padding(.top, topOfFeeds - 150 * scaleModifier)
            .zIndex(1)
            
            ScrollView {
                ScrollViewReader { proxy in
                    GeometryReader { geo in
                        let topY = geo.frame(in: .global).minY
                        Color.red.onChange(of: topY) { oldValue, newValue in
                            print(topY)
                            topOfFeeds = topY > 160 * scaleModifier ? topY : 160 * scaleModifier
                        }.onAppear {
                            print(topY)
                            topOfFeeds = topY > 160 * scaleModifier ? topY : 160 * scaleModifier
                        }
                    }
                    .frame(height: 0)
                    .background(.red)
                    
                    ForEach(Categories.allCases, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text(item.rawValue)
                                .font(.custom("RalewayRoman-Regular", size: 16, relativeTo: .title))
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.horizontal, Margins.M)
                                .padding(.top, 24)
                                .id(item)
                            
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 19),
                                                GridItem(.flexible(), spacing: 19)],
                                      spacing: 9) {
                                ForEach(0..<15, id: \.self) { _ in
                                    PostView()
                                }
                            }
                        }
                        .padding(.horizontal, Margins.M)
                    }
                    
                    .onChange(of: selectedCategory) { newValue, oldValue in
                        if let oldValue {
                            withAnimation {
                                proxy.scrollTo(oldValue, anchor: .top)
                            }
                        }
                    }
                }
                //                .padding(.top, topOfFeeds)
                
                
                
                //                .onAppear { UIFont.familyNames.forEach { print(UIFont.fontNames(forFamilyName: $0)) } }
            }
            
            .padding(.top, topOfFeeds/*269 * scaleModifier*/)
            
            //            .position(x: UIScreen.main.bounds.midX, y: topOfFeeds)
            .background(Color.background)
            
        }
        
    }
    
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
