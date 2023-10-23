//
//  nointernetview.swift
//  news
//
//  Created by Aaryan Prabhakar on 23/10/23.
//

import SwiftUI

struct nointernetview: View {
    @State private var isAlertPresented = false

    var body: some View {
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    // Show the alert when the view appears
                    isAlertPresented = true
                }
            
            
                .alert(isPresented: $isAlertPresented) {
                    Alert(
                        title: Text("No Interenet Found!"),
                        message: Text("App will be closed"),
                        dismissButton:.default(Text("Ok"), action: {
                            //exit(0)
                        })
                           
                    )
                }

                    
                    
                
            
        
            
        }
       
    }
       
}

struct nointernetview_Previews: PreviewProvider {
    static var previews: some View {
        nointernetview()
    }
}

