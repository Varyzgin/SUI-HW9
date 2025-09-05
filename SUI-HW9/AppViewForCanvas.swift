//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

struct AppViewForCanvas: View {
    @State var navBarBottom: CGFloat = 0
    var body: some View {
        ZStack(alignment: .top) {
            NavBarView(navBarBottom: $navBarBottom)
                .zIndex(1)

            ZStack(alignment: .bottom) {
                
                MainPageView(navBarBottom: $navBarBottom)
                
                TabBarView()
                    .frame(alignment: .bottom)
                    .zIndex(1)
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    AppViewForCanvas()
}

