//
//  HotelDetailsView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 14/8/24.
//

import Foundation
import SwiftUI

struct HotelDetailsView: View {
    let hotel: Hotels
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            ZStack(alignment: .top){
                VStack(alignment: .leading,spacing: 20){
                    ZStack {
                        AsyncImage(url:URL(string: hotel.imageName)){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        } placeholder: {
                            ProgressView()
                        }
                    }.frame(maxHeight: 300)
                    
                    VStack(alignment: .leading,spacing: 20){
                        HStack {
                            Image(systemName: "clock").resizable().frame(width: 25,height: 25).foregroundColor(.orange)
                            Text("3 House").font(.custom("Poppin-Light", size: 16)).foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "star").resizable().frame(width: 25,height: 25).foregroundColor(.orange)
                            Text("3 House").font(.custom("Poppin-Light", size: 16)).foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "thermometer.transmission").resizable().frame(width: 25,height: 25).foregroundColor(.orange)
                            Text("3 House").font(.custom("Poppin-Light", size: 16)).foregroundColor(.gray)
                        }.padding(.horizontal)
                        
                        HStack {
                            Text("\(hotel.locationName)").font(.custom("Poppin-Regular", size: 16)).foregroundColor(.black)
                            Spacer()
                            Text("\(hotel.price)").font(.custom("Poppin-Regular", size: 16)).foregroundColor(.black)
                        }
                        
                        Text("Description").font(.custom("Poppin-Regular", size: 16)).foregroundColor(.black)
                        
                        ScrollView(.vertical,showsIndicators: false){
                            Text(hotel.description).font(.custom("Poppin-Light", size: 16)).foregroundColor(.gray)
                        }
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    Button {} label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color(.orange))
                                .frame(height: 50)
                            Text("Bool a Trip").font(.custom("Poppin-Regular", size: 18)).foregroundColor(.white)
                        }
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(.horizontal)
                }
                .navigationTitle("\(hotel.displayName),\(hotel.locationName)")
                .toolbarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    HotelDetailsView(hotel: Hotels.bellagio)
}
