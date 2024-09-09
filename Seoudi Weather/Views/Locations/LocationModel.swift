//
//  LocationModel.swift
//  Seoudi Weather
//
//  Created by ahmed moharam on 09/09/2024.
//

import Foundation
import UIKit

struct LocationModel {
    let name: String
    let image: UIImage
    let lat: String
    let long: String
    
    static let locations: [LocationModel] = [
        LocationModel(name: "Cairo",
                      image: ImagesDesignSystem.images.cairoIcon.image,
                      lat: "30.058991",
                      long: "31.234164"),
        
        LocationModel(name: "Alexandria",
                      image: ImagesDesignSystem.images.alexIcon.image,
                      lat: "31.189308",
                      long: "29.959823"),
        
        LocationModel(name: "Damietta",
                      image: ImagesDesignSystem.images.domiatIcon.image,
                      lat: "31.435694",
                      long: "31.662624"),
        
        LocationModel(name: "Matrouh",
                      image: ImagesDesignSystem.images.matro7Icon.image,
                      lat: "31.352464",
                      long: "27.224044"),
        
        LocationModel(name: "Dubai",
                      image: ImagesDesignSystem.images.dubaiIcon.image,
                      lat: "25.204849",
                      long: "55.270782"),
        
        LocationModel(name: "France",
                      image: ImagesDesignSystem.images.franceIcon.image,
                      lat: "46.227638",
                      long: "2.213749"),
        
        LocationModel(name: "Libya",
                      image: ImagesDesignSystem.images.lebiaIcon.image,
                      lat: "26.335100",
                      long: "17.228331"),
    ]
}
