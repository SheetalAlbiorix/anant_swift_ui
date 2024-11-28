//
//  MapView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
        
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
    
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
       
          MapAnnotation(coordinate: item.location) {
            MapAnnotationView(location: item)
          }
        })
        .overlay(
            HStack(alignment:.center ,spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48,alignment: .center)
                
                VStack(alignment:.leading,spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    Divider()
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                }
            }
                .padding(.vertical,12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(10)
                        .opacity(0.6)
            )
                .padding()
                ,alignment: .top
        )
    }
}



struct MapView_PreViews : PreviewProvider{
    static var previews: some View{
        MapView()
    }
}
