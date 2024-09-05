//
//  MasonryVStackView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 5/9/24.
//

import Foundation
import SwiftUI

struct ColumnModel {
    var id = UUID()
    var item: GridItem
    
    static let columns = [
        ColumnModel(item: GridItem()),
        ColumnModel(item: GridItem()),
        ColumnModel(item: GridItem()),
    ]
}



struct MasonryVStackView: View {
    
    @State var show  = false
    @Namespace private var namespace
    @State var selectedImage: ImageOnePiece? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack(alignment:.top,spacing: 5) {
                ForEach(ColumnModel.columns,id: \.id) {_ in
                    VStack {
                        ForEach(ImageOnePiece.ImageOnePieces, id: \.self) { images  in
                            AsyncImage(url: images.url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(height: CGFloat.random(in: 130...400))
                                case .success(let image):
                                    image
                                        .resizable()
                                       // .matchedGeometryEffect(id: images.id, in: namespace) optional when image other id
                                        .frame(height: CGFloat.random(in: 130...400))
                                        .clipped()
                                case .failure:
                                    Color.gray
                                        .frame(height: CGFloat.random(in: 130...400))
                                @unknown default:
                                    Color.clear
                                        .frame(height: CGFloat.random(in: 130...400))
                                }
                            }
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.spring(duration: 0.5)){
                                    selectedImage = images
                                    show.toggle()
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .overlay {
            if show, let selectedImage = selectedImage {
                ImageView(imageUrl: selectedImage.url, show: $show, namespace: namespace)
            }
        }
    }
}


#Preview {
    MasonryVStackView()
}


