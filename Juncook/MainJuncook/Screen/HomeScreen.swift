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
                Text("Welcome to Home").foregroundStyle(Color.orange)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Home")
                            .font(.title)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("Home")
                            .font(.title)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("Home")
                            .font(.title)
                            .foregroundColor(.orange)
                    }
                }
            }
            .preferredColorScheme(.dark)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color.black)
        }
        
    }
}


#Preview {
    HomeScreen()
}
