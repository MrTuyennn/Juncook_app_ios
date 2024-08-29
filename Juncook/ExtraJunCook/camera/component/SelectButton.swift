//
//  SelectButton.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 6/8/24.
//

import Foundation
import SwiftUI

struct SelectButton: View {
    
    var action:() -> Void
    
    var body: some View {
        Button(action: action){
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 70, height: 70, alignment: .center)
                .overlay(
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)).font(.system(size: 35))
        }
    }
}
