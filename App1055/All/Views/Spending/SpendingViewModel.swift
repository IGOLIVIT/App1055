//
//  SpendingViewModel.swift
//  App1055
//
//  Created by IGOR on 21/11/2024.
//

import SwiftUI
import CoreData

final class SpendingViewModel: ObservableObject {

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

    @Published var spName: String = ""
    @Published var spCost: String = ""
    @Published var spCat: String = ""
    @Published var spDate: String = ""
    @Published var spText: String = ""

    @Published var spendings: [SpenModel] = []
    @Published var selectedSpend: SpenModel?

    func addSpend() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SpenModel", into: context) as! SpenModel

        loan.spName = spName
        loan.spCost = spCost
        loan.spCat = spCat
        loan.spDate = spDate
        loan.spText = spText

        CoreDataStack.shared.saveContext()
    }

    func fetchSpends() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SpenModel>(entityName: "SpenModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.spendings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.spendings = []
        }
    }
}
