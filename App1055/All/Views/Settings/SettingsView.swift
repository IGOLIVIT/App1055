//
//  SettingsView.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding(.bottom, 20)
                
                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 12, weight: .regular))
                                .frame(width: 26, height: 26)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.black))
                            
                            Text("Rate us")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))

                            Spacer()
                            
                            Text("Rate")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                                .padding(7)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.15)))
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "") else { return }
                        
                        UIApplication.shared.open(url)
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "person.badge.shield.checkmark.fill")
                                .foregroundColor(Color.black)
                                .font(.system(size: 25, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                            Text("Read")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                                .padding(7)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.15)))
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
