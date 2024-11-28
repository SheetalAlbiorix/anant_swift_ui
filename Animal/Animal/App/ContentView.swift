//
//  ContentView.swift
//  Animal
//
//  Created by Anant Prajapati on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
   
    @State private var isGridTapped : Bool = false
//   Advanced Grid Layout   //
    @State private var gridlayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    
    func gridSwitch () {
      gridlayout = Array(repeating: .init(.flexible()), count: gridlayout.count % 3 + 1)
        gridColumns = gridlayout.count
        print("Grid Number : \(gridColumns)")
        
        switch gridColumns {
            case 1 :
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3 :
                toolbarIcon = "rectangle.grid.1x2"
            default :
                toolbarIcon = "square.grid.2x2"
                
        }
    }
    
    var body: some View {
        NavigationView{
            Group{
                if !isGridTapped {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridlayout ,alignment: .center,spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination:AnimalDetailView(animal: animal)){
                                 AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Africa")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing : 16){
                        Button(action: {
                            print("Button Tapped")
                            isGridTapped = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundColor(isGridTapped ? .primary : .accentColor)
                        })
                        
                        Button(action: {
                            print("Button is Activated")
                            isGridTapped = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title3)
                                .foregroundColor(isGridTapped ?.accentColor : .primary)
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
   
}



