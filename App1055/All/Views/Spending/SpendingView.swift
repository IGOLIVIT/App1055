//
//  SpendingView.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct SpendingView: View {
    
    @StateObject var viewModel = SpendingViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Spending")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(Color("prim2")))
                    })
                }
                .padding(.bottom, 20)
                
                if viewModel.spendings.isEmpty {
                    
                    VStack(spacing: 9) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                        
                        Text("You haven't added any spending")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                    .padding(5)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.spendings, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 9) {
                                    
                                    Text(index.spDate ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(index.spName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text(index.spCat ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text(index.spCost ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32, weight: .medium))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 200)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                                .padding(5)
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchSpends()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddSpend(viewModel: viewModel)
        })
    }
}

#Preview {
    SpendingView()
}
