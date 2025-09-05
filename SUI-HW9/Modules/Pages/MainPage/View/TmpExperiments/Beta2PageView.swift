//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

struct Beta2PageView: View {
    @State var selectedCategory: Categories?
    @State var deltaScroll: CGFloat = 0
    
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
                //                GeometryReader { geo in
                //                    Color.red.onChange(of: geo.frame(in: .global).minY) {
                //                        print(geo.frame(in: .global).minY)
                //                    }
                //                }
                //                .frame(height: 1)
            }
            .background(Color.background)
            .padding(.top, deltaScroll + 117 * scaleModifier)
            .zIndex(1)
            
            ScrollView {
                ScrollViewReader { proxy in
                    VStack {
                        GeometryReader { geo in
                            Color.green
                                .onChange(of: geo.frame(in: .global).minY) { oldValue, newValue in
                                    print(newValue)
                                    deltaScroll = newValue > -105 * scaleModifier ? newValue : -105 * scaleModifier
                                }
                                .onAppear{
                                    print(geo.frame(in: .global).minY)
                                }
                        }
                        .frame(height: 269)
                        
                        ForEach(Categories.allCases, id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text(item.rawValue)
                                    .font(.custom("RalewayRoman-Regular", size: 16, relativeTo: .title))
                                    .fontWeight(.semibold)
                                    .frame(alignment: .leading)
                                    .padding(.horizontal, Margins.M)
                                    .padding(.top, 24)
                                    .id(item)
                                    .overlay {
                                        Color.green
                                            .frame(height: 0)
                                            .padding(.bottom, (269 + 80) * scaleModifier)
                                            .id("anchor-\(item)")
                                    }
                                
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
                        .onChange(of: selectedCategory) { old, new in
                            if let section = new {
                                withAnimation {
                                    proxy.scrollTo("anchor-\(section)", anchor: .top)
                                }
                            }
                          
                        }
                    }
                }
//                .onAppear { UIFont.familyNames.forEach { print(UIFont.fontNames(forFamilyName: $0)) } }
            }
            .background(Color.background)
        }
    }
}
