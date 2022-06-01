//
//  Constants.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation

// Storyboards
struct Storyboards {
    static let main = "Main"
   
}

// Urls
struct URLs {
    static let base = "https://saurav.tech/NewsAPI/everything/"
    //auth
    static let home = "cnn.json"
    
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let contentLength = "Content-Length"
    static let host = "Host"
    //static let token = "X-CSRF-TOKEN"
    //static let acceptLanguage = "Accept-Language"
    static let lang = "lang"
    static let authorization  = "Authorization"
    static let userAgent = "User-Agent"
    static let apiPassword = "api-password"
    static let acceptEncoding = "Accept-Encoding"
    
    }

// Parameters Key
struct ParameterKeys {
    static let username = "username"
    static let password = "password"
    static let doctor_id = "doctor_id"
    static let doctorID = "doctor_id"
    static let specialtyID = "specialty_id"
    static let cityID = "city_id"
    static let regionID = "region_id"
    static let companyID = "company_id"
    static let name = "name"
    static let orderBy = "order_by"
    static let comment = "comment"
    static let rating = "rating"
    static let paginationPageNumber = "page"
    static let PaginationPerPage = "perPage"
    static let text = "product"
    static let userAppointmentID = "user_appointment_id"
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let email = "email"
    // Doctor Appoinment
    static let id = "doctor_id"
    static let appointment = "appointment"
    static let voucher = "voucher"
    static let bookforanother = "book_for_another"
    static let patientName = "patient_name"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "AccessToken"
    static let isLoggedIn = "IsLoggedIn"
    static let categoryId = "CategoryId"
}

struct viewControllers {
    static let homevc = "HomeVC"
}

// Custom Cells
struct CustomCells {
    static let mainCell = "MainCell"
//    static let searchResultCell = "SearchResultCell"
//    static let favoriteCell = "FavoriteCell"
}
