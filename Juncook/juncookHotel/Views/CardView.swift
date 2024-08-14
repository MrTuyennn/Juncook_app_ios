//
//  CardView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 12/8/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    var travelName: String
    var travelLocation: String
    var travelImage: String
    var isLiked: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.linearGradient(colors:[Color("back"),Color("back2")],startPoint: .topTrailing,endPoint: .bottomLeading))
                .frame(width: 250,height: 250)
            
            AsyncImage(url:URL(string:travelImage)) { image in
               image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth:250)
                    .cornerRadius(25)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250,height: 250)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .frame(width: 40,height: 40)
                        Image(systemName: isLiked ? "heart.fill" : "heart").resizable().scaledToFit().frame(width: 25,height: 25).foregroundColor(Color("c0rage"))
                    }
                    Spacer()
                    
                    Text(travelName).font(.custom("Poppins-Regular", size: 18)).foregroundStyle(.white).kerning(-1)
                    HStack {
                        Image(systemName: "mappin.and.ellipse.cirle").imageScale(.large).foregroundColor(.white)
                        Text(travelLocation).font(.custom("Poppins-Light", size: 15)).foregroundStyle(.white).kerning(-1)
                    }
                }.padding([.vertical,.horizontal])
            }.frame(maxWidth: 250,maxHeight: 250)
        }
    }
}
