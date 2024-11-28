//
//  CardView.swift
//  Hike
//
//  Created by Anant Prajapati on 31/07/24.
//

import SwiftUI

struct CardView: View {
    // MARK :- PROPERTIES
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    // MARK:- FUNCTION
    
    func randomImage () {
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackground()
            VStack {
                // MARK :- HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(colors: [.gray,.black],
                                               startPoint: .topLeading,
                                               endPoint: .bottomLeading)
                                
                        )
                      Spacer()
                        Button{
                            //: Action Part Show a Sheet
                            print("Button Was Pressed")
                            isShowingSheet.toggle()
                            
                        } label: {
                           CustomButton()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large ]) //: Half Sheet Present
                                               
                        }
                    }
                    Text("Fun and OutDoor Activity for friend and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.CustomGrayMedium)
                }   //:  HEADER
                .padding(.horizontal,30)
                // MARK :- Main Content
                ZStack {
                   CustomCircleView()
                    Image("image-\(imageNumber)")
                         .resizable()
                         .scaledToFit()
                         .animation(.easeOut(duration: 3), value: imageNumber)
                }
                //: FOOTER
                Button{
                   print("Button is pressed")
                    randomImage()
                }label: {
                    Text("Explore Now")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.CustomGreenLight,.CustomGreenMedium],
                                           startPoint: .top, 
                                           endPoint: .bottom
                                          )
                                    )
                       
                }
                .buttonStyle(GradientButton())
            }//: Zstack
        }//: Card
        .frame(width: 300,height:  570)
    }
}

#Preview {
    CardView()
}
