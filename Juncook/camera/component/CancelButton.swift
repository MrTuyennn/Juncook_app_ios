//
//  CancelButton.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 6/8/24.
//

import Foundation
import SwiftUI

struct CancelButton: View {
    
    var action: () ->  Void
    
    var body: some View {
        Button(action: action){
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 70, height: 70, alignment: .center)
                .overlay(
                    Image(systemName: "xmark")
                        .foregroundColor(.red)).font(.system(size: 35))
        }
    }
}
