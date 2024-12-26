//
//  BooksView.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct BooksView: View {

    @StateObject var viewModel = BooksViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Books")
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
                
                if viewModel.books.isEmpty {
                    
                    VStack(spacing: 9) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                        
                        Text("You haven't added any books")
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
                        
                        LazyVStack {
                            
                            ForEach(viewModel.books, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 14) {

                                    Text(index.bBook ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .medium))
                                                                        
                                    HStack {
                                        
                                        Image(systemName: "person")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Text(index.bAuthor ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Spacer()
                                    }
                                                                        
                                    Text(index.bPlot ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .medium))
                                        .lineLimit(3)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedBook = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        Text("Read")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 55)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 250)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                                .padding(5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchBooks()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddBook(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            BookDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    BooksView()
}
