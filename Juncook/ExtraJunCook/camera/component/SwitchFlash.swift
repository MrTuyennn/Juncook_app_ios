//
//  SwitchFlash.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 6/8/24.
//

import Foundation
import SwiftUI

struct SwitchFlash: View {
    
    var action:  () -> Void
    var isFlashOn: Bool
    
    var body: some View {
        Button(action: action
               , label: {
            Image(systemName: isFlashOn ? "bolt.fill" : "bolt.slash.fill")
                .font(.system(size: 20, weight: .medium, design: .default))
        })
        .accentColor(isFlashOn ? .yellow : .white)
    }
}
