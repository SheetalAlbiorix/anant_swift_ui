//
//  OnBoardingView.swift
//  Advanced SwiftUI Frameworks
//
//  Created by Anant Prajapati on 05/08/24.
//

import SwiftUI

struct OnBoardingView: View {

    //MARK: Properties
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    @State private var buttonwidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonoffset: CGFloat = 0
    @State private var isAnimating : Bool = false
    @State private var imageOffset : CGSize = .zero
    @State private var indicatorOpacity : Double = 1.0
    
    
    
    //MARK: Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all , edges: .all)
            
            // Main VStack
            VStack(spacing: 20) {
                
                
                //MARK: HEADER
                Spacer()
              
                VStack(spacing : 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                    .foregroundColor(.white)
                    
                    Text("""
                      It's not how you give but
                      how much love we put into giving.
                    """)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    
                } // End of Header
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1),value: isAnimating)
                
                
                //MARK: Centre
                
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x:imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                         DragGesture()
                            .onChanged{ gesture in
                                if abs(imageOffset.width) <= 150{
                                    imageOffset = gesture.translation
                                    
                                    withAnimation(.linear(duration : 0.25)) {
                                        indicatorOpacity = 0
                                    }
                                    
                                }
                            }
                            .onEnded{ _ in
                                imageOffset = .zero
                                withAnimation(.linear(duration : 0.25)) {
                                    indicatorOpacity = 1
                                }
                            }
                        )
                        .animation(.easeOut(duration: 1),value: imageOffset)
                }// End of Centre
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44,weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y : 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                        ,  alignment: .bottom
                )
                
                Spacer()
                
                //MARK: FOOTER
                ZStack{
                    //1.BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    //2.CALL-TO-ACTION(STATIC)
                    Text("Get Started")
                        .font(.system(.title2,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    
                    
                    
                    //3.CAPSULE(DYNAMIC WIDTH)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonoffset + 80)
                            
                        Spacer()
                    }
                    
                    //4.CIRCLE(DRAGABLE)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                            
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80,height: 80,alignment: .center)
                        .offset(x: buttonoffset)
                        .gesture(
                          DragGesture()
                            .onChanged{ gesture in
                                if gesture .translation.width > 0  && buttonoffset <= buttonwidth - 80{
                                    buttonoffset = gesture.translation.width
                                }
                                
                            }
                            .onEnded { _ in
                                
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonoffset > buttonwidth / 2{
                                       buttonoffset = buttonwidth - 80
                                       isOnboardingActive = false
                                        }else{
                                       buttonoffset = 0
                                    }
                                }
                            }
                        )
                            
                        Spacer()
                    } //End of HStack
                    
                }// End of Zstack
                .frame(width: buttonwidth,height: 80,alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1),value: isAnimating)
                
            }// END OF Main VSTACK
            
        }// END OF ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnBoardingView()
}
