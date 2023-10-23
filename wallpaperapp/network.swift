//
//  network.swift
//  news
//
//  Created by Aaryan Prabhakar on 22/10/23.
//


//
//  NetworkMonitor.swift
//  Test
//
//  Created by Cairocoders
//
 
import Foundation
import Network
import SwiftUI


class NetworkMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
        

 

var body: some Scene {
    WindowGroup {
        ContentView()
    }
}


