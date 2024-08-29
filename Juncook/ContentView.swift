//
//  ContentView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 31/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("AppScheme") private var appScheme: AppScheme = .devive
    @SceneStorage("ShowScenePickerView") private var showPickerView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...40,id: \.self) {
                   Text("Chat history \($0)")
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showPickerView.toggle() 
                    } label: {
                        Image(systemName: "moon.fill").foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
