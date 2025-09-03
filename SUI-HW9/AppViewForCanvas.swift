//
//  ContentView.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

struct AppViewForCanvas: View {    
    var body: some View {
        ZStack(alignment: .top) {
            NavBarView()
                .zIndex(1)

            ZStack(alignment: .bottom) {
                
                MainPageView()
                
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

