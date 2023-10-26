//
//  wallpaperappApp.swift
//  wallpaperapp
//
//  Created by Aaryan Prabhakar on 23/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth



@main
struct wallpaperappApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    @StateObject private var userSettings=UserSettings()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            /*if (userSettings.isFirstLaunch){
                onboard()
            }
            else if(userSettings.isLoggedIn){
                 homeview()
                        .environmentObject(networkMonitor)
                
            }*/
            
                    onboard().environmentObject(networkMonitor)
            
               
                
            
            /*else{
                loginview()
            }*/
           
        }
    }
}
class UserSettings:ObservableObject{
   /* @Published var isFirstLaunch:Bool{
        didSet{
            UserDefaults.standard.set(isFirstLaunch,forKey:"isFirstLaunch")
        }
    }*/
    @Published var isLoggedIn:Bool{
        didSet{
            UserDefaults.standard.set(isLoggedIn,forKey: "isLoggedIn")
        }
    }
    init(){
       // self.isFirstLaunch=UserDefaults.standard.bool(forKey: "isFirstLaunch")
        self.isLoggedIn=UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
