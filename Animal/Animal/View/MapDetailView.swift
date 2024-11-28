//
//  MapDetailView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI
import MapKit

struct MapDetailView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286,longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
             NavigationLink(
                destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(5)
                    
                    )
                }
                .padding(12),alignment: .topTrailing
                
            )
            .frame(height: 256)
            .cornerRadius(10)
    }
}


struct MapDetailView_Previews : PreviewProvider{
    static var previews: some View{
        MapDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
