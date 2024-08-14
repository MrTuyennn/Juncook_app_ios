//
//  EventListView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 13/8/24.
//

import Foundation
import SwiftUI



struct EventListView: View {
    var eventName: String
    var eventImage: String
    var eventLocation: String
    var eventLocationImage: String
    var eventPrice: String
    var eventRate: String
    var eventRateImage: String
    var topLeft: CGFloat = 20
        var bottomLeft: CGFloat = 20
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 25)
            
            HStack(spacing:15){
                AsyncImage(url:URL(string: eventImage)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 130,height: 130)
//                .clipShape(RoundedCorner(radius: topLeft, corners: [.topLeft, .bottomLeft]))
            }
        }
    }
}
