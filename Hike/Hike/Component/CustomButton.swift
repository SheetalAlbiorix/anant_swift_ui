//
//  CustomButton.swift
//  Hike
//
//  Created by Anant Prajapati on 01/08/24.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.CustomGreenLight,.CustomGreenMedium],
                                   startPoint: .topLeading,
                                   endPoint: .bottomLeading)
                    
                )
            Circle()
                .stroke(
                    LinearGradient(colors: [.CustomGrayLight,.CustomGrayMedium],
                                   startPoint: .top,
                                   endPoint: .bottom),
                                   lineWidth: 4)
        Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [
                        .CustomGrayLight,
                        .CustomGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
        .frame(width: 58,height: 58)
    }
}

#Preview {
    CustomButton()
        .previewLayout(.sizeThatFits)
        .padding()
}
