//
//  BooksViewModel.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI
import CoreData

final class BooksViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isAddImage: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPhoto: Bool = false

    @Published var daysOfWeek: [String] = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    @Published var currentDayOfWeek = ""
    @Published var dayOfWeekForAdd = ""
    
    @AppStorage("images") var images: [String] = []
    
    @Published var photos: [String] = ["im1", "im2"]
    @Published var currentPhoto = ""

    @Published var bBook: String = ""
    @Published var bAuthor: String = ""
    @Published var bPlot: String = ""

    @Published var books: [BookModel] = []
    @Published var selectedBook: BookModel?

    func addBook() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "BookModel", into: context) as! BookModel

        loan.bBook = bBook
        loan.bAuthor = bAuthor
        loan.bPlot = bPlot

        CoreDataStack.shared.saveContext()
    }

    func fetchBooks() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BookModel>(entityName: "BookModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.books = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.books = []
        }
    }
}
