//
//  AddSpend.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct AddSpend: View {

    @StateObject var viewModel: SpendingViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New spending")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
          
                            viewModel.spName = ""
                            viewModel.spCost = ""
                            viewModel.spCat = ""
                            viewModel.spDate = ""
                            viewModel.spText = ""
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .medium))
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.spName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.spName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }

                        VStack(alignment: .leading) {
                            
                            Text("Cost")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.spCost.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.spCost)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Category")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.spCat.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.spCat)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
         
                        VStack(alignment: .leading) {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.spDate.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.spDate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }

                        VStack(alignment: .leading) {
                            
                            Text("Text")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.spText.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.spText)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    }
                }
                
                Button(action: {

                    viewModel.addSpend()
                    
                    viewModel.spName = ""
                    viewModel.spCost = ""
                    viewModel.spCat = ""
                    viewModel.spDate = ""
                    viewModel.spText = ""
                    
                    viewModel.fetchSpends()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                })
                .opacity(viewModel.spName.isEmpty || viewModel.spCost.isEmpty || viewModel.spCat.isEmpty || viewModel.spDate.isEmpty || viewModel.spText.isEmpty ? 0.5 : 1)
                .disabled(viewModel.spName.isEmpty || viewModel.spCost.isEmpty || viewModel.spCat.isEmpty || viewModel.spDate.isEmpty || viewModel.spText.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddSpend(viewModel: SpendingViewModel())
}
