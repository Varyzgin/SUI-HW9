//
//  SUI_HW9App.swift
//  SUI-HW9
//
//  Created by Dim on 21.08.2025.
//

import SwiftUI

@main
struct SUI_HW9App: App {
    @State var scaleModifier = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16) / 16
    
    var body: some Scene {
        WindowGroup {
            AppViewForCanvas()
                .onAppear {
                    print(scaleModifier)
                }
        }
    }
}
