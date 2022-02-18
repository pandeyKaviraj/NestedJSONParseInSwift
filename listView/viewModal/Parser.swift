//
//  Parser.swift
//  listView
//
//  Created by helloKaviraj MBP on 18/02/22.
//

import Foundation


struct Parser {
    func parse() {
        let api = URL(string: "https://api.github.com/repos/Alamofire/Alamofire/issues")
        //server gives data in json format so below decode it
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Data is not empty")
                return
            }
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                    print(result)
            } catch {
                
            }
        }.resume()
    }
}
