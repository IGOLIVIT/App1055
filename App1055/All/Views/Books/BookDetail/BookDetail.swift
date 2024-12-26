//
//  BookDetail.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct BookDetail: View {
    
    @StateObject var viewModel: BooksViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Book")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {

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
                        
                        Button(action: {

                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                                
                        }, label: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.red)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        HStack {
                            
                            Spacer()
                            
                            Image(systemName: "person")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.selectedBook?.bAuthor ?? "")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                            
                        }

                            
                            Text(viewModel.selectedBook?.bBook ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                                .padding(.bottom)
                            
                            Text(viewModel.selectedBook?.bPlot ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    Text("Delete Book?")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteBook(withBBook: viewModel.selectedBook?.bBook ?? "", completion: {
                                
                                viewModel.fetchBooks()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 15)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    BookDetail(viewModel: BooksViewModel())
}
