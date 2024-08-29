//
//  AppContainer.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 29/8/24.
//

import Foundation
import SwiftUI

struct AppContainer: View {
    var body: some View {
        TabView {
            NavigationStack {
                            HomeScreen()
                    .navigationTitle(
                        "Home"
                    )
            }
            .tabItem {
                Label(
                    "Home",
                    systemImage: "house.fill"
                )
            }
            
            /* --- */
            NavigationStack {
                CommonScreen()
                    .navigationTitle(
                        "Common"
                    )
            }
            .tabItem {
                Image(
                    systemName: "ev.plug.dc.nacs.fill"
                )
                Text(
                    "Home"
                )
            }
            
            /* --- */
            NavigationStack {
                StoreScreen()
                    .navigationTitle(
                        "Store"
                    )
            }
            .tabItem {
                Image(
                    systemName: "folder.fill"
                )
                Text(
                    "Home"
                )
            }
            /* --- */
            NavigationStack {
                SettingScreen()
                    .navigationTitle(
                        "Setting"
                    )
            }
            .tabItem {
                Image(
                    systemName: "gearshape.fill"
                )
                Text(
                    "Home"
                )
            }
        }
    }
}

#Preview {
    AppContainer()
}
