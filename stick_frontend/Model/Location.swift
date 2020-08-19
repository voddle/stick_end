//
//  Location.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/19.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import MapKit

struct Map {
    
    private var locationManager = CLLocationManager()
    
    var location: CLLocation? = nil
    //地理位置编码
//    let locationManager = CLLocationManager()
//
//        //地理位置代码
////        locationManager.delegate = self //代理CLLocationManagerDelegate
////        locationManager.requestAlwaysAuthorization()
////        locationManager.startUpdatingLocation()
//    //不清楚有什么用的代码
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locationManager.stopUpdatingLocation()
//        let changeLocation:NSArray =  locations as NSArray
//        let currentLocation = changeLocation.lastObject as! CLLocation
//        let geoCoder = CLGeocoder()
//        geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
//            if((placemarks?.count)! > 0){
//                let placeMark = placemarks?.first
//                if let currentCity = placeMark?.locality {
//                    print("=============\(currentCity)")
//                }
//                print(placeMark?.country ?? "")
//                print(placeMark?.thoroughfare ?? "")
//                print(placeMark?.name ?? "")
//                print(placeMark?.subLocality ?? "")
//
//            }else if (error == nil && placemarks?.count == 0){
//                print("没有地址返回");
//            }
//            else if ((error) != nil){
//                print("location error\(String(describing: error))");
//            }
//        }
//    }
}
