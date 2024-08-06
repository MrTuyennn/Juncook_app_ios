//
//  CameraView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 31/7/24.
//

import Foundation
import SwiftUI

struct CameraView: View {

  @ObservedObject var viewModel = CameraViewModel()

  @State private var isFocused = false
  @State private var isScaled = false
  @State private var focusLocation: CGPoint = .zero
  @State private var currentZoomFactor: CGFloat = 1.0
  @State private var isShowImage = false

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Color.black.edgesIgnoringSafeArea(.all)

        VStack(spacing: 0) {

          SwitchFlash(
            action: {
              viewModel.switchFlash()
            },
            isFlashOn: viewModel.isFlashOn
          )

          ZStack {
            CameraPreview(session: viewModel.session) { tapPoint in
              isFocused = true
              focusLocation = tapPoint
              viewModel.setFocus(point: tapPoint)
              UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
            .gesture(
              MagnificationGesture()
                .onChanged { value in
                  self.currentZoomFactor += value - 1.0  // Calculate the zoom factor change
                  self.currentZoomFactor = min(max(self.currentZoomFactor, 0.5), 10)
                  self.viewModel.zoom(with: currentZoomFactor)
                }
            )
            .animation(.easeInOut, value: 0.5)
            if isShowImage {
              VStack {

              }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity
              ).background(Color.red)
            }
            if isFocused {
              FocusView(position: $focusLocation)
                .scaleEffect(isScaled ? 0.8 : 1)
                .onAppear {
                  withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                    self.isScaled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                      self.isFocused = false
                      self.isScaled = false
                    }
                  }
                }
            }
          }

          HStack {
              if isShowImage {
                  CancelButton(action: {
                      
                  })
                 
                  Spacer()
                  SelectButton(action: {
                      self.isShowImage = false
                  })
              } else {
                  PhotoThumbnail(image: $viewModel.capturedImage)
                  Spacer()
                  CaptureButton {
                    //                            viewModel.captureImage()
                    self.isShowImage = true
                  }
                  Spacer()
                  CameraSwitchButton { viewModel.switchCamera() }
              }
           
          }
          .padding(20)
        }
      }
      .alert(isPresented: $viewModel.showAlertError) {
        Alert(
          title: Text(viewModel.alertError.title), message: Text(viewModel.alertError.message),
          dismissButton: .default(
            Text(viewModel.alertError.primaryButtonTitle),
            action: {
              viewModel.alertError.primaryAction?()
            }))
      }
      .alert(isPresented: $viewModel.showSettingAlert) {
        Alert(
          title: Text("Warning"),
          message: Text(
            "Application doesn't have all permissions to use camera and microphone, please change privacy settings."
          ),
          dismissButton: .default(
            Text("Go to settings"),
            action: {
              self.openSettings()
            }))
      }
      .onAppear {
        viewModel.setupBindings()
        viewModel.requestCameraPermission()
      }
    }
  }

  func openSettings() {
    let settingsUrl = URL(string: UIApplication.openSettingsURLString)
    if let url = settingsUrl {
      UIApplication.shared.open(url, options: [:])
    }
  }
}

struct PhotoThumbnail: View {
  @Binding var image: UIImage?

  var body: some View {
    Group {
      if let image {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 60, height: 60)
          .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

      } else {
        Rectangle()
          .frame(width: 50, height: 50, alignment: .center)
          .foregroundColor(.black)
      }
    }
  }
}

#Preview {
  CameraView()
}
