//
//  Not.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable Notification")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding(8)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
