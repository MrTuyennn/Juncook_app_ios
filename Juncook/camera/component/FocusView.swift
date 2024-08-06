//
//  FocusView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 6/8/24.
//

import Foundation
import SwiftUI

struct FocusView: View {
    
    @Binding var position: CGPoint
    
    var body: some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.clear)
            .border(Color.yellow, width: 1.5)
            .position(x: position.x, y: position.y)
    }
}
