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
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(1...500, id: \.self) { number in
                            Text("\(number)")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .background(Color.black)
                .scrollIndicators(.hidden)
                .padding(0)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Home")
                        .font(.title)
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.title)
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Home")
                        .font(.title)
                        .foregroundColor(.orange)
                }
            }
            .preferredColorScheme(.dark)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color.black)
            .toolbarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


#Preview {
    HomeScreen()
}
