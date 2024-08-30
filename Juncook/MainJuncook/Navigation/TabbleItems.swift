//
//  TabbleItems.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 30/8/24.
//

import Foundation
import SwiftUI

enum TabbleItems: Int, CaseIterable {
    case home
    case common
    case store
    case setting
    
    var title: String {
        switch self {
        case .home:
             return "Home"
        case .common:
            return "Common"
        case .store:
            return "Store"
        case .setting:
            return "Setting"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
             return "house.fill"
        case .common:
            return "ev.plug.dc.nacs.fill"
        case .store:
            return "folder.fill"
        case .setting:
            return "gearshape.fill"
        }
    }
}

struct CustomItemTabView: View {
    let textItem: String
    let imageitem: String
    let isActive: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageitem).foregroundColor(isActive == true ? Color.orange : Color.gray)
            Text(textItem).foregroundColor(isActive == true ? Color.orange : Color.gray)
        }.onAppear {
            print("isActive for \(textItem): \(isActive)") // Debugging: Print active state
        }
    }
}
