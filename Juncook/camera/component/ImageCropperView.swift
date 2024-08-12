//
//  ImageCropperView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 7/8/24.
//

import Foundation
import SwiftUI

struct ImageCropperView: View {
  @Binding var imageCropper: UIImage?

  @State private var cropRect = CGRect(x: 50, y: 50, width: 200, height: 200)
  @State private var scale: CGFloat = 1.0
  @State private var lastScaleValue: CGFloat = 1.0

  // location DragGesture
  @State private var dragOffset: CGSize = .zero
  @State private var position: CGSize = .zero

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if let image = imageCropper {
          Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()

          Circle()
            .fill(Color.red)
            .shadow(radius: 20)
            .frame(width: 100)
            .offset(x: dragOffset.width + position.width, y: dragOffset.height + position.height)
            .gesture(
              DragGesture()
                .onChanged({ (value) in
                  self.dragOffset = value.translation
                })
                .onEnded({ (value) in
                  self.position.width += value.translation.width
                  self.position.height += value.translation.height
                  self.dragOffset = .zero
                })
            )

          //                    Rectangle()
          //                        .path(in: cropRect)
          //                        .stroke(Color.red, lineWidth: 2)
          //                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
          //                        .offset(x:viewLocation.width,y:viewLocation.height)
          //                        .gesture(
          //                            DragGesture().onChanged{ value in
          //                                viewLocation = value.translation
          //                            }
          //                                .onEnded { value in
          //                                    withAnimation(.spring()){
          //                                        viewLocation = .zero
          //                                    }
          //                                }
          //                        )
          //
          //                        .gesture(DragGesture()
          //                            .onChanged { value in
          //                                cropRect.origin.x += value.translation.width
          //                                cropRect.origin.y += value.translation.height
          //
          //                            print("----> 1 \(value.translation)")
          //                            }
          //                        )
          //                        .gesture(MagnificationGesture()
          //                            .onChanged { value in
          //                                let delta = value / lastScaleValue
          //                                cropRect.size.width *= delta
          //                                cropRect.size.height *= delta
          //                                lastScaleValue = value
          //                                print("----> 2 \(delta)")
          //                            }
          //                            .onEnded { _ in
          //                                lastScaleValue = 1.0
          //                            }
          //                        )
        }
      }
    }
    .overlay(
      Button(action: cropImage) {
        Text("Crop")
          .padding()
          .background(Color.black.opacity(0.7))
          .foregroundColor(.white)
          .cornerRadius(10)
      }
      .padding(),
      alignment: .bottom
    )
  }

  func cropImage() {
    guard let image = imageCropper, let cgImage = image.cgImage else { return }

    let scale = image.size.width / UIScreen.main.bounds.width
    let scaledCropRect = CGRect(
      x: cropRect.origin.x * scale,
      y: cropRect.origin.y * scale,
      width: cropRect.size.width * scale,
      height: cropRect.size.height * scale
    )

    if let croppedCgImage = cgImage.cropping(to: scaledCropRect) {
      imageCropper = UIImage(cgImage: croppedCgImage)
    }
  }
}

extension Rectangle {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.addRect(rect)
    return path
  }
}
