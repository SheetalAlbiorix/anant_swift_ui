//
//  RipeningStagesView.swift
//  Avacado
//
//  Created by Anant Prajapati on 13/09/24.
//

import SwiftUI

struct RipeningStagesView: View {
    
    var ripeningStages:[Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            VStack{
                Spacer()
                HStack(alignment:.center,spacing: 25){
                    ForEach(ripeningStages) { item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal,25)
                Spacer()
            }
        }
        .padding(.vertical)
        .padding(.horizontal,20)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RipeningStageView_Previews : PreviewProvider {
    static var previews: some View{
        RipeningStagesView(ripeningStages: ripeningData)
    }
}
