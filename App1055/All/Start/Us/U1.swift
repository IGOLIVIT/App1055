//
//  U1.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Text("Start now and earn more")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("A proven way to make easy money")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                    })
                    .padding(.horizontal)
                }
                .padding()
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .frame(height: 370)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    U1()
}
