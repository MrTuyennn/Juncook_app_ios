//
//  HomeView.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 15/8/24.
//

import Foundation
import SwiftUI


struct HomeView: View {
    
    // state
    @State var menuNameID = 0
    private var eventMenuName = ["Hotel","Camp","Ship","Flight","Mountain","Concert",]
    private var eventMenuImage = ["house.fill","tent.fill","water.fill","airplane","mountain.2.fill","music.quarternote.3"]
    @State var eventID = 0
    let menuName = ["All","Popular","Tours","Sights"]
    //state
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.15).ignoresSafeArea()
                
                VStack(spacing:20){
                    HStack{
                        Image(systemName: "line.3.horizontal").imageScale(.large)
                        Spacer()
                        Image(systemName: "magnifyingglass").imageScale(.large)
                    }
                    
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(alignment:.leading,spacing: 20){
                            Text("Enjoy The World").font(.custom("Poppins-Regular", size: 18)).kerning(-1)
                            
                            //
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack {
                                    ForEach(menuName.indices,id: \.self) { items in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(menuNameID == items ? Color(.orange) : .white)
                                                .frame(width: 120,height: 40)
                                            Text(menuName[items]).font(.custom("Poppins-Light", size: 18)).foregroundColor(menuNameID == items ? .white : .gray).kerning(-1)
                                        }
                                        .onTapGesture {
                                            withAnimation {
                                                menuNameID = items
                                            }
                                        }
                                    }
                                }
                            }
                            //
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack {
                                    ForEach(Favorite.allCases,id: \.self) { items in
                                        CardView(travelName: items.displayName, travelLocation: items.locationName, travelImage: items.imageName, isLiked: true)
                                    }
                                }
                            }
                            //
                            
                            HStack {
                                Text("All Event").font(.custom("Poppins-Regular", size: 18)).kerning(-1)
                                Spacer()
                                Text("See All").font(.custom("Poppins-Regular", size: 18)).kerning(-1).foregroundColor(.orange)
                            }
                            //
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing:25) {
                                    ForEach(eventMenuName.indices,id: \.self) { items in
                                        horizontalEventsCard(menuName: eventMenuName[items], menuImage: eventMenuImage[items], rectColor: eventID == items ? Color(.orange) : .white, ImageColor: eventID == items ? .white : Color(.orange), textColor: eventID == items ? Color(.orange) : .gray)
                                            .onTapGesture {
                                                eventID = items
                                            }
                                    }
                                }
                            }.padding(.bottom)
                            
                            if eventID == 0 {
                                ForEach(Hotels.allCases,id: \.displayName) {items in
                                    NavigationLink(
                                        destination: HotelDetailsView(hotel: items)) {
                                            EventListView(eventName: items.displayName, eventImage: items.imageName, eventLocation: items.locationName, eventLocationImage: "mappin.and.ellipse.circle", eventPrice: items.price, eventRate:items.rate, eventRateImage: "star.fill").foregroundColor(.black)
                                        }.transition(.blurReplace)
                                }
                            } else if eventID == 1 {
                                ForEach(Camp.allCases,id: \.displayName) {items in
                                    NavigationLink(
                                        destination: CampDetailView(camp: items)) {
                                            EventListView(eventName: items.displayName, eventImage: items.imageName, eventLocation: items.locationName, eventLocationImage: "mappin.and.ellipse.circle", eventPrice: items.price, eventRate:items.rate, eventRateImage: "star.fill").foregroundColor(.black)
                                        }.transition(.blurReplace)
                                }
                            } else if eventID == 2 {
                                ForEach(Ship.allCases,id: \.displayName) {items in
                                    NavigationLink(
                                        destination: ShipDetailView(ship: items)) {
                                            EventListView(eventName: items.displayName, eventImage: items.imageName, eventLocation: items.locationName, eventLocationImage: "mappin.and.ellipse.circle", eventPrice: items.price, eventRate:items.rate, eventRateImage: "star.fill").foregroundColor(.black)
                                        }.transition(.blurReplace)
                                }
                            }
                            
                        }
                    }
                    
                }.padding(.horizontal)
            }
        }
    }
}


#Preview {
    HomeView()
}
