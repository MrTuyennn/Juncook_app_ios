//
//  ImageView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 5/9/24.
//

import Foundation
import SwiftUI

struct ImageView: View {
    var imageUrl: URL
    @Binding var show: Bool
    var namespace:Namespace.ID
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: CGFloat.random(in: 130...400))
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: imageUrl, in: namespace)
                            .frame(width: geometry.size.width,height: geometry.size.height)
                            .onTapGesture {
                                withAnimation(.spring(duration: 0.3)){
                                    show.toggle()
                                }
                            }
                    case .failure:
                        Color.gray
                            .frame(height: CGFloat.random(in: 130...400))
                    @unknown default:
                        Color.clear
                            .frame(height: CGFloat.random(in: 130...400))
                    }
                }
            })
        }
        .background(.thinMaterial)
        .ignoresSafeArea()
    }
}
