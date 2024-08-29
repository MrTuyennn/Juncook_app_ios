//
//  ContainerRelativeFrame.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 23/8/24.
//

import Foundation
import SwiftUI

struct CRFModule: View {
    
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Text("jun-cook").font(.custom("Poppin-Regular", size: 20)).foregroundColor(.white)
        }
//        .frame(maxWidth:.infinity)
//        .frame(height: screenHeight / 4)
//        .containerRelativeFrame([.horizontal,.vertical])
//        .containerRelativeFrame(.horizontal,{lenght, _ in return lenght / 1.5})
//        .containerRelativeFrame(.vertical,{lenght, _ in return lenght / 1.5})
        .containerRelativeFrame([.horizontal,.vertical],{lenght, axis in if axis == .horizontal {
            return lenght
        } else {
            return lenght / 3
        }})
        .background(.orange)
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(0 ..< 10) { index in
                    Rectangle()
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .containerRelativeFrame(.horizontal,count: 2,spacing: 10.0)
                }
            }
        }
        
    }
}


#Preview {
    CRFModule()
}
