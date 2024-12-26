//
//  CoursesView.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI

struct CoursesView: View {

    @StateObject var viewModel = CoursesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Courses")
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
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currentType == index ? .black : .white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentType == index ? 1 : 0)))
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                .padding(5)
                .padding(.bottom)
                
                if viewModel.currentType == "Study now" {
                
                if viewModel.courses.isEmpty {
                    
                    VStack(spacing: 9) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                        
                        Text("You haven't added any course")
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
                            
                            ForEach(viewModel.courses, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedCourse = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        HStack {
                                            
                                            Text(index.coStart ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(index.coStart ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Spacer()
                                        }
                                        
                                        Text(index.coDet ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text(index.coName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text(index.coType ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 28, weight: .regular))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 160)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                                    .padding(5)
                                })
                            }
                        })
                    }
                }
                    
                } else {
                    
                    VStack(spacing: 9) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.black).shadow(color: .gray.opacity(0.5), radius: 5))
                    .padding(5)
                    
                    Spacer()
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCourses()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCourse(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CourseDetil(viewModel: viewModel)
        })
    }
}

#Preview {
    CoursesView()
}
