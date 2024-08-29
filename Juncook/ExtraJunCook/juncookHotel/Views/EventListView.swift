import SwiftUI

struct EventListView: View {
    var eventName: String
    var eventImage: String
    var eventLocation: String
    var eventLocationImage: String
    var eventPrice: String
    var eventRate: String
    var eventRateImage: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 130)
            
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: eventImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 130, height: 130)
                .cornerRadius(25)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(eventName)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .lineLimit(1)
                    
                    HStack {
                        Image(systemName: eventLocationImage).foregroundColor(.yellow)
                        Text(eventLocation)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    
                    HStack {
                        Image(systemName: eventRateImage).foregroundColor(.yellow)
                        Text(eventRate)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    Text(eventPrice)
                        .font(.headline)
                        .foregroundColor(.green)
                }
                .padding(.vertical, 10)
                
                Spacer()
                
               
            }
//            .padding(.horizontal, 15)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ForEach(Hotels.allCases, id: \.displayName) { items in
        NavigationLink(
            destination: HotelDetailsView(hotel: items)) {
                EventListView(
                    eventName: items.displayName,
                    eventImage: items.imageName,
                    eventLocation: items.locationName,
                    eventLocationImage: "mappin.and.ellipse.circle",
                    eventPrice: items.price,
                    eventRate: items.rate,
                    eventRateImage: "star.fill"
                )
                .foregroundColor(.black)
            }
            .transition(.blurReplace)
    }
}
