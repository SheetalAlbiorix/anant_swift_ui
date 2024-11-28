//
//  CustomGradientButton.swift
//  Hike
//
//  Created by Anant Prajapati on 01/08/24.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Condition  Statment Using Ternary Operator
                // Condition ? A : B
                // A is Where user presssed buttonLinearGradient(colors: [.CustomGrayMedium,.CustomGrayLight], startPoint: .top, endPoint: .bottom)
                // B is Where user button is Not Pressed
            
                configuration.isPressed ? LinearGradient(colors: [.CustomGrayMedium,.CustomGrayLight], startPoint: .top, endPoint: .bottom) :LinearGradient(colors: [.CustomGrayLight,.CustomGrayMedium], startPoint: .top, endPoint: .bottom)

            )
            .cornerRadius(40)
    }
}
//LinearGradient(colors: [.CustomGrayLight,.CustomGrayMedium], startPoint: .top, endPoint: .bottom)
