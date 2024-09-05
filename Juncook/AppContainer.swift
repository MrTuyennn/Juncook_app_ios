//
//  AppContainer.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 29/8/24.
//

import Foundation
import SwiftUI

struct AppContainer: View {
    
    @State private var selectedTab = 0
    
    init(){
        let appearance = UITabBarAppearance()
        
        appearance.backgroundColor = UIColor.black
        
        
        // Set color for selected items
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.orange
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        
        // Set color for unselected items
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach((TabbleItems.allCases), id: \.self){ item in
                VStack{
                    content(for: item)
                }.tabItem {
                    Button{
                        selectedTab = item.rawValue
                    } label: {
                        CustomItemTabView(textItem: item.title, imageitem: item.iconName, isActive: selectedTab == item.rawValue)
                    }
                }
                
            }
        }.background(Color.black)
    }
    
    
    @ViewBuilder
    private func content(for tab: TabbleItems) -> some View {
        switch  tab {
        case .home:
            MasonryVStackView()
        case .common:
            CommonScreen()
        case .store:
            StoreScreen()
        case .setting:
            SettingScreen()
        }
    }
}



#Preview {
    AppContainer()
}
