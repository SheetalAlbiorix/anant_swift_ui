//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Anant Prajapati on 02/08/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // PROPERTIES :-
    @State private var randomNumber : Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    // FUNCTION   :-
    //Random Coordinate
    func randomCoordinate () -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //Random Size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    //Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    //Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //
    var body: some View {
        ZStack {
            ForEach(0...randomNumber,id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(CGPoint(
                        x: randomCoordinate(),
                        y: randomCoordinate()))
                    .scaleEffect(isAnimating ? randomScale() : 1)
                
                
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
            }
                
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
            .fill(.teal)
        
        )
  
}
