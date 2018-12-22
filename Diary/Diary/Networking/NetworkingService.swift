//
//  NetworkingService.swift
//  Diary
//
//  Created by Святослав Катола on 12/18/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingService {
    
    static var shared = NetworkingService()
    private init() { }
    
    func getJsonNotes(filename fileName: String, callback: ([CodableNote]?, Error?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CodableNote].self, from: data)
                for item in jsonData {
                    coreData.add(name: item.name, text: item.text, image: UIImage(url: URL(string: item.imageURL)))
                }
                callback(jsonData, nil)
            } catch {
                callback(nil, error)
            }
        }
    }
    //using example
//    NetworkingService.shared.getJsonNotes(filename: "document") { receivedNotes, errors in
//       DispatchQueue.main.async {
//          guard let rn = receivedNotes else {
//           print("error: \(errors!))")
//          return
//      }
//       for note in rn {
//          print(note.name + note.text)
//          }
//       }
//    }
}
