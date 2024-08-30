//
//  HomeScreen.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 29/8/24.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Home")
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.largeTitle)
                        .foregroundColor(.red) // Customize title color
                }
            }
        }
        
    }
}


#Preview {
    HomeScreen()
}
