//
//  horizontalEventsCard.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 13/8/24.
//

import Foundation
import SwiftUI

struct horizontalEventsCard: View {
    var menuName: String
    var menuImage: String
    var rectColor: Color
    var ImageColor: Color
    var textColor: Color
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(rectColor)
                    .frame(width: 60,height: 60)
                Image(systemName: menuImage).resizable().scaledToFit().frame(width: 35,height: 35).foregroundColor(ImageColor)
            }
            Text(menuName).font(.custom("Poppins-Regular", size: 18)).foregroundStyle(textColor).kerning(-1)
        }
    }
}
