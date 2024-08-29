//
//  SchemePickerView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 28/8/24.
//

import Foundation
import SwiftUI

enum AppScheme: String {
    case dark = "Dark"
    case light = "Light"
    case devive = "Device"
}
fileprivate struct SchemePreview: Identifiable {
    var id: UUID = .init()
    var image: UIImage?
    var text: String
}

struct SchemeHostView<Content: View>: View {
    
    @ViewBuilder var content: Content
    /// View Propertise
    @AppStorage("AppScheme") private var appScheme: AppScheme = .devive
    @SceneStorage("ShowScenePickerView") private var showPickerView: Bool = false
    @State private var  showSheet: Bool = false
    @State private var schemePreviews: [SchemePreview] = []
    @Environment(\.colorScheme) private var scheme
    @State private var overlayWindow: UIWindow?
    var body: some View {
        content.sheet(isPresented: $showSheet, onDismiss: {
            schemePreviews = []
            showPickerView = false
        }, content: {
            SchemePickerViews(preview: $schemePreviews,appScheme: $appScheme)
        })
        .onChange(of: showPickerView){
            oldValue, newValue in
            if newValue {
                generateSchemePreview()
            } else {
                showSheet = false
            }
        }
        .onAppear {
            Task {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene, overlayWindow == nil {
                    let window = UIWindow(windowScene: scene)
                    window.backgroundColor = .clear
                    window.isHidden = false
                    window.isUserInteractionEnabled = false
                    let emptyController = UIViewController()
                    emptyController.view.backgroundColor = .clear
                    window.rootViewController = emptyController
                    
                    overlayWindow = window
                }
            }
        }
    }
    
    /// Generating Scheme Previews and then pushing the sheet view
    private func generateSchemePreview() {
        Task {
            if let window = await (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow, schemePreviews.isEmpty {
                let defaultStyle = await MainActor.run { window.overrideUserInterfaceStyle }
                let size = await MainActor.run { window.screen.bounds.size }
                let defaultSchemePreview = await MainActor.run { window.subviews.first?.image(size) }
                
                schemePreviews.append(.init(
                    image: defaultSchemePreview,
                    text: scheme == .dark ? AppScheme.dark.rawValue : AppScheme.light.rawValue))
                
                showOverplayImageView(defaultSchemePreview)
                
                await MainActor.run {
                    window.overrideUserInterfaceStyle = scheme.oppositeInterfaceStyle
                }
                
                let otherSchemePreviewImage = await MainActor.run { window.subviews.first?.image(size) }
                schemePreviews.append(.init(
                    image: otherSchemePreviewImage, // Use the correct preview image
                    text: scheme == .dark ? AppScheme.light.rawValue : AppScheme.dark.rawValue)) // Correct the label text
                
                // Resetting to its default style
                await MainActor.run {
                    window.overrideUserInterfaceStyle = defaultStyle
                }
                try? await Task.sleep(for: .seconds(0))
                removeOverplayImageView()
                showSheet = true
            }
        }
    }
    
    private func showOverplayImageView(_ image: UIImage?) {
           DispatchQueue.main.async {
               guard let overlayWindow = overlayWindow else { return }
               guard let rootView = overlayWindow.rootViewController?.view else { return }
               
               if rootView.subviews.isEmpty, let image = image {
                   let imageView = UIImageView(image: image)
                   imageView.contentMode = .scaleAspectFit
                   imageView.frame = rootView.bounds
                   
                   rootView.addSubview(imageView)
               }
           }
       }
    
    private func removeOverplayImageView(){
        DispatchQueue.main.async {
            overlayWindow?.rootViewController?.view.subviews.forEach {
                $0.removeFromSuperview()
            }
        }
        
    }
    
}

fileprivate extension ColorScheme {
    var oppositeInterfaceStyle: UIUserInterfaceStyle {
        return self == .dark ? .light : .dark
    }
}

struct SchemePickerViews: View {
    @Binding fileprivate var preview: [SchemePreview]
    @Binding var appScheme: AppScheme
    @State private var localSchemeState: AppScheme = .devive
    var body: some View {
        VStack(alignment:.leading,spacing: 15){
            Text("Appearance").font(.title3.bold())
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            GeometryReader { _ in
                HStack(spacing: 0){
                    ForEach(preview){ previews in
                        SchemeCardView([previews])
                    }
                    SchemeCardView(preview)
                }
            }
            
        }.padding(20)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .topLeading)
            .background {
                ZStack {
                    Rectangle()
                        .fill(.background)
                    Rectangle()
                        .fill(Color.primary.opacity(0.05))
                }.clipShape(.rect(cornerRadius: 20))
            }
            .padding(.horizontal,15)
            .presentationDetents([.height(320)])
            .presentationBackground(.clear)
            .onChange(of: appScheme, initial: true) { oldValue, newValue in
                localSchemeState = newValue
            }
    }
    
    @ViewBuilder
    fileprivate  func SchemeCardView(_ preview: [SchemePreview]) -> some View {
        VStack(spacing: 6) {
            if let image = preview.first?.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        if let secondImage = preview.last?.image, preview.count == 2 {
                            GeometryReader {
                                let width = $0.size.width / 2
                                Image(uiImage: secondImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .mask(alignment: .trailing) {
                                        Rectangle()
                                            .frame(width: width)
                                    }
                            }
                        }
                    }
                    .clipShape(.rect(cornerRadius: 15))
            }
            let text = preview.count == 2 ? "Device" : preview.first?.text ?? ""
            Text(text)
                .font(.caption)
                .foregroundStyle(.gray)
            
            ZStack {
                Image(systemName: "circle")
                
                if localSchemeState.rawValue == text {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.primary)
                        .transition(.blurReplace)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .contentShape(.rect)
        .onTapGesture {
            if preview.count == 2 {
                appScheme = .devive
            } else {
                appScheme = preview.first?.text == AppScheme.dark.rawValue ? .dark : .light
            }
            updateScheme()
        }
    }
    private func updateScheme() {
        if let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow {
            window.overrideUserInterfaceStyle = appScheme == .dark ? .dark : appScheme == .light ? .light : .unspecified
        }
    }
}


extension UIView {
    func image(_ size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            drawHierarchy(in: .init(origin: .zero, size: size), afterScreenUpdates: true)
        }
    }
}


//#Preview {
//    SchemePickerViews()
//}
