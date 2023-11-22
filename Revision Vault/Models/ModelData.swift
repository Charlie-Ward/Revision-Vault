//
//  ModelData.swift
//  Revision Vault
//
//  Created by Charlie Ward on 13/11/2023.
//
import Foundation

final class ModelData: ObservableObject {
    var subjects: [Subject] = load("subjectData.json")
    
    var homeFeatures: [Subject] {
        subjects.filter{ $0.isHomeFeatured }
    }
    
    var flashcardFeatures: [Subject] {
        subjects.filter{ $0.isFlashcardFeatured }
    }
    
    var pastExamQsFeatures: [Subject] {
        subjects.filter{ $0.isPastExamQsFeatured }
    }
    
    var categories: [String: [Subject]] {
        Dictionary(
            grouping: subjects,
            by: { $0.category.rawValue }
        )
    }
}
    
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
