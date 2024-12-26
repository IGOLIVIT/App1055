//
//  LaodingView.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct LaodingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 130)
            }
        }
    }
}

#Preview {
    LaodingView()
}
