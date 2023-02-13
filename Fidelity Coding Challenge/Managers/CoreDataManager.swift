//
//  Persistence.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Fidelity_Coding_Challenge")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func fetchFavoriteCryptocurrencies() -> [FavoriteCryptocurrency]? {
        let request = NSFetchRequest<FavoriteCryptocurrency>(entityName: "FavoriteCryptocurrency")

        return try? container.viewContext.fetch(request)
    }

    func saveFavoriteCryptocurrency(id: String) -> FavoriteCryptocurrency {
        let favoriteCryptocurrency = FavoriteCryptocurrency(context: container.viewContext)

        favoriteCryptocurrency.id = id

        saveContext()

        return favoriteCryptocurrency
    }

    func deleteFavoriteCryptocurrency(currency: FavoriteCryptocurrency) {
        container.viewContext.delete(currency)

        saveContext()
    }

    private func saveContext() {
        do {
            try container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
