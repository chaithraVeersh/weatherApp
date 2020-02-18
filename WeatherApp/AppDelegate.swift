//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Chaithra on 2/15/20.
//  Copyright © 2020 Chaithra TV. All rights reserved.
//

import UIKit
import GoogleSignIn
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initialSetUp()
        if let loggedInUser =  UserDefaults.standard.value(forKey: "userID") as? String {
            print(loggedInUser)
            let notice = WeatherInfoRouter.createModule()
                   self.window = UIWindow(frame: UIScreen.main.bounds)
                   self.window?.rootViewController = notice
                   self.window?.makeKeyAndVisible()
                   return true
        }
        return true
    }

    func initialSetUp(){
        GIDSignIn.sharedInstance().clientID = googleSignInKey
        if GMSPlacesClient.provideAPIKey(googlePlacesApiKey) {
            print("dklsgjksdjg")
            

            
        }
        else {
            print("dsjgghkhgj")

        }
        
    }

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }


}

