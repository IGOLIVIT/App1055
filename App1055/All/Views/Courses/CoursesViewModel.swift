//
//  CoursesViewModel.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI
import CoreData

final class CoursesViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @AppStorage("images") var images: [String] = []
    
    @Published var types: [String] = ["Study now", "Wait list"]
    @Published var currentType = "Study now"

    @Published var coName: String = ""
    @Published var coDur: String = ""
    @Published var coDet: String = ""
    @Published var coType: String = ""
    @Published var coStart: String = ""
    @Published var coNot: String = ""

    @Published var courses: [CourseModel] = []
    @Published var selectedCourse: CourseModel?

    func addCourse() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CourseModel", into: context) as! CourseModel

        loan.coName = coName
        loan.coDur = coDur
        loan.coDet = coDet
        loan.coType = coType
        loan.coStart = coStart
        loan.coNot = coNot

        CoreDataStack.shared.saveContext()
    }

    func fetchCourses() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CourseModel>(entityName: "CourseModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.courses = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.courses = []
        }
    }
}
