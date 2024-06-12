//
//  Appetizer.swift
//  AppetizerApplication
//
//  Created by David Okechukwu on 4/23/24.
//

import Foundation

//Models appetizer objects from the appetizer JSON response
struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description:String
    let price:Double
    let imageURL:String
    let calories: Int
    let protein: Int
    let carbs: Int
    //description
    //price
    //imageurl
    //calories
    //id
    //carbs
    //name
}
//Has to be decoded into the corresponding array.. should not be a parent in the hierarchy but the exact level]
//For Appetizers it is Response -> ["Decodable Array with properties"]
struct AppetizerResponse: Decodable{
    let request: [Appetizer]
    
}

//Use MockData structs to populate UI
struct MockData{
    static let sampleAppetizer = Appetizer(id: 4, name: "Flank", description: "Yummy....", price: 4.3, imageURL: "asian-marinded-skirt-steak-21-1024x683", calories: 12, protein: 4, carbs: 5)
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]

}

