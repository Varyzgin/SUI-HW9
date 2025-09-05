//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

struct BetaPageView: View {
    @State var selectedCategory: Categories?
    @State var deltaScroll: CGFloat = 0
    @State var offsetOfFeeds: CGFloat = 0
    
    var body: some View {
        let scaleModifier: CGFloat = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
        
        ZStack(alignment: .top){
//            VStack(alignment: .leading, spacing: 0) {
//                SearchAndFiltersView()
//                    .padding(.horizontal, Margins.M)
//                
//                Text("Категории")
//                    .font(.custom("RalewayRoman-Regular", size: 16, relativeTo: .title))
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.horizontal, Margins.M)
//                    .padding(.top, 24)
//                    .padding(.bottom, 14)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 16) {
//                        ForEach(Categories.allCases, id: \.self) { category in
//                            Button {
//                                self.selectedCategory = category
//                                print(category)
//                            } label: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .foregroundStyle(.white)
//                                        .frame(width: 108 * scaleModifier, height: 40 * scaleModifier)
//                                    Text(category.rawValue)
//                                        .font(.custom("Poppins-Regular", size: 12, relativeTo: .body))
//                                        .padding(.vertical, 11)
//                                }
//                            }
//                            .tint(.darkGrey)
//                        }
//                    }
//                    .padding(.horizontal, Margins.M)
//                }
//                .padding(.bottom, 14)
//                //                GeometryReader { geo in
//                //                    Color.red.onChange(of: geo.frame(in: .global).minY) {
//                //                        print(geo.frame(in: .global).minY)
//                //                    }
//                //                }
//                //                .frame(height: 1)
//            }
//            .background(Color.background)
//            //            .padding(.top, topOfFeeds - 150 * scaleModifier)
//            .zIndex(1)
            VStack {
                Rectangle()
                    .frame(width: 50, height: 269 + deltaScroll)
                ScrollView {
                    ScrollViewReader { proxy in
                        VStack {
                            GeometryReader { geo in
                                Color.red
                                    .onChange(of: geo.frame(in: .named("scroll")).minY) { oldValue, newValue in
                                        print(newValue)
                                        deltaScroll = newValue //> 160 ? newValue : 160
                                    }
                                    .onAppear{
                                        print(geo.frame(in: .named("scroll")).minY)
                                    }
                            }
                            .frame(height: 0)
                            
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
                        }
                    }
                    //                .padding(.top, topOfFeeds)
                    //                .onAppear { UIFont.familyNames.forEach { print(UIFont.fontNames(forFamilyName: $0)) } }
                    
                }
                .coordinateSpace(name: "scroll")

                .background(Color.red)
                
            }
            
//            .offset(x: UIScreen.main.bounds.minX, y: 269 + topOfFeeds)
            //            .padding(.top, 269 + topOfFeeds )//+ topOfFeeds/*269 * scaleModifier*/)
            //            .position(x: UIScreen.main.bounds.midX, y: topOfFeeds)
            
        }
        //        ScrollView {
        //            ScrollViewReader { proxy in
        //                GeometryReader { geo in
        //                    Color.red
        //                        .frame(height: 2) // невидимый элемент
        //                        .onChange(of: geo.frame(in: .named("scroll")).minY) { oldValue, newValue in
        //                            print(newValue)
        //                            topOfFeeds = newValue
        //                        }
        //                }
        //
        //                VStack {
        //                    ForEach(Categories.allCases, id: \.self) { item in
        //                        Text(item.rawValue)
        //                            .id(item)
        //                            .padding(.vertical, 400)
        //                    }
        //                }
        //            }
        //        }
        //        .background(.red)
        //        .coordinateSpace(name: "scroll")
        //        .padding(.top, 200 + topOfFeeds)
    }
    
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 200
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
