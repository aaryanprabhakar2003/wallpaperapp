//
//  ContentView.swift
//  news
//
//  Created by Aaryan Prabhakar on 21/10/23.
//
import SwiftUI
import Network
import FirebaseAuth
import Firebase
import UIKit
import Kingfisher
struct onboard: View {
    //@EnvironmentObject var userSettings:UserSettings
   // @State private var issignup=false;
    var body: some View {
        NavigationStack {
            ZStack {
                Color("txt")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "wallet.pass.fill")
                        .font(.system(size:45))
                        .padding()
                    Text("FreeWalls")
                        .bold()
                        .font(.title)
                    
                   /* Button {
                        issignup.toggle()
                        userSettings.isFirstLaunch=false
                    } label: {
                        Text("Continue")
                        
                            .padding()
                            .frame(maxWidth:.infinity)
                            .bold()
                            .background(Color("borderclr"))
                            .foregroundColor(Color("txt"))
                            .cornerRadius(10)
                    }
                    if(issignup){
                        signupview()
                    }*/

                    NavigationLink {
                       
                        
                        signupview()
                        //userSettings.isFirstLaunch=false
                    }
                label: {
                    Text("Continue")
                        .padding()
                        .frame(maxWidth:.infinity)
                        .bold()
                        .background(Color("borderclr"))
                        .foregroundColor(Color("txt"))
                        .cornerRadius(10)
                }
                    
                }
                .padding()
            }
        }
        
    }
}

struct homeview:View{
   
    
    var body: some View{
        
        ZStack{
            VStack{
                //NavigationStack{
                TabView{
                    explore()
                        .tabItem {
                            Image(systemName: "safari")
                            Text("Explore")
                        }
                    categories()
                        .tabItem{
                            Image(systemName: "square.grid.2x2")
                            Text("Categories")
                        }
                   trending()
                    
                    
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Trending")
                            
                        }
                  settings()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("ssettings")
                        }
                }
             
                
            }
        }
        //.navigationTitle("OneWalls")
        
        //.navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        
    }
}

struct explore:View{
    @State private var loadimagebefore=URL(string: "https://firebasestorage.googleapis.com/v0/b/wallpaperxcode.appspot.com/o/john-towner-JgOeRuGD_Y4-unsplash.jpg?alt=media&token=e7b0e422-68f5-4ac1-874a-b6ff4c0d26fb&_gl=1*88uty4*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5Nzk2Njc3MC4xLjEuMTY5Nzk2Njg1NS42MC4wLjA.")
    
    
    
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    let rows = [
        GridItem(.fixed(200))
    ]
    
    var body: some View{
        ZStack{
            ScrollView() {
                VStack {
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHGrid(rows:rows,spacing: 10){
                            
                            
                            Image("art")
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(15)
                            
                            
                            
                            
                            ScrollView(.horizontal){
                                LazyHGrid(rows:rows,spacing: 10){
                                    Image("art")
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(15)
                                    
                                    
                                    
                                    
                                    Image("cosmic")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(15)
                                    
                                    
                                    Image("ios17")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(15)
                                    
                                }
                                
                            }
                            
                            .frame(height: 250)
                            
                            
                            
                            VStack{
                                Text("Explore")
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .bold()
                                
                                LazyVGrid(columns:columns,spacing: 20){
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        
                        
                    }
                }
                
                
                .padding()
                
            }
            
            
            
        }
    }
}
    
    struct categories:View{
        
        
        
        let columns = [
            GridItem(.adaptive(minimum: 200))
        ]
        
        @State private var mountainsheet=false;
        @State private var imageloader=false;
        @State private var carsheet=false;
        @State private var amoledsheet=false;
        @State private var naturesheet=false;
        @EnvironmentObject var networkMonitor: NetworkMonitor
        @State private var isloading=true;
        
      
        
        
        
         var  imageURLString_mountains="https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/john-towner-JgOeRuGD_Y4-unsplash-2.jpg?alt=media&token=7fa9138c-0560-46b6-afd7-23a458035fde&_gl=1*1e788ot*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODMxNTY3Ni44LjEuMTY5ODMxNTk1OS40OS4wLjA."
        
        var  imageURLString_cars="https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/tyler-clemmensen-d1Jum1vVLew-unsplash-2.jpg?alt=media&token=5e007daa-440b-434c-9f31-1c29ff1efa33&_gl=1*1rwd914*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODMxNTY3Ni44LjEuMTY5ODMxNjg5OC41NS4wLjA."
        var  imageURLString_amoled="https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/wade-meng-LgCj9qcrfhI-unsplash.jpg?alt=media&token=34ca970f-4859-4624-acf1-8c0605835c98&_gl=1*1jwmj29*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODMxNTY3Ni44LjEuMTY5ODMxNzI1OS4yMy4wLjA."
        
        var  imageURLString_nature="https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/andreas-gucklhorn-mawU2PoJWfU-unsplash.jpg?alt=media&token=e133b060-c768-4c29-8e53-fd23ce44d1f1&_gl=1*188ln6l*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODQ4OTM3OS4xMC4xLjE2OTg0OTI3NzUuMTQuMC4w."
        var body: some View{
            
            //if(networkMonitor.isConnected){
                ZStack{
                    VStack(spacing: 0.0){
                        Text("Categories")
                            .font(.title)
                            .bold()
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding()
                        
                        VStack{
                            let imageURL_mountains=URL(string:imageURLString_mountains)
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns:columns,spacing: 20){
                                    Button {
                                        mountainsheet.toggle()
                                    } label: {
                                        /*AsyncImage(url: imageURL_mountains,content: { phase in
                                            if let image=phase.image{
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        Text("Mountains")
                                                            .font(.custom("teko",size:25))
                                                            .foregroundColor(Color(.white))
                                                            .bold()
                                                        
                                                            .frame(maxWidth:.infinity,alignment: .trailing)
                                                            .offset(y:90)
                                                            .padding()
                                                    )
                                                
                                                    .sheet(isPresented: $mountainsheet) {
                                                        mountain1()
                                                    }
                                                
                                                
                                                
                                                
                                            }
                                            
                                            else if (phase.error != nil){
                                                Text("Error loading Image From Server")
                                                    .foregroundColor(Color("borderclr"))
                                                
                                                
                                            }
                                            
                                            else{
                                                
                                                
                                                ProgressView("Loading...")
                                                
                                                
                                                
                                                
                                            }
                                        }
                                                   
                                        )*/
                                        
                                        
                                        KFImage(imageURL_mountains)
                                            .resizable()
                                            .cacheOriginalImage()
                                            .scaledToFit()
                                            .cornerRadius(15)
                           
                                            
                                            .overlay(
                                                Text("MOUNTAINS")
                                                    .font(.custom("teko",size:25))
                                                    .foregroundColor(Color(.white))
                                                    .bold()
                                                
                                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                                    .offset(y:90)
                                                    .padding()
                                            )
                                            .sheet(isPresented: $mountainsheet) {
                                                mountain1()
                                            }
                                  
                                        
                                        
                                        
                                        
                                    }
                                        
                                    
                                    
                                
                                    
                                    let imageURL_cars=URL(string:imageURLString_cars)
                                    Button {
                                        carsheet.toggle()
                                        
                                    } label: {
                                        /*AsyncImage(url: imageURL_cars,content: { phase in
                                            if let image=phase.image{
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        Text("Cars")
                                                            .font(.custom("teko",size:25))
                                                            .foregroundColor(Color(.white))
                                                            .bold()
                                                        
                                                            .frame(maxWidth:.infinity,alignment: .trailing)
                                                            .offset(y:90)
                                                            .padding()
                                                    )
                                                
                                                    .sheet(isPresented: $carsheet) {
                                                        car1()
                                                    }
                                                
                                                
                                                
                                                
                                            }
                                            
                                            else if (phase.error != nil){
                                                Text("Error loading Image From Server")
                                                    .foregroundColor(Color("borderclr"))
                                                
                                                
                                            }
                                            
                                            else{
                                                ProgressView("Loading...")
                                                
                                                
                                                
                                                
                                            }
                                        }
                                                   
                                        )*/
                                        KFImage(imageURL_cars)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                            
                                            .overlay(
                                                Text("CARS")
                                                    .font(.custom("teko",size:25))
                                                    .foregroundColor(Color(.white))
                                                    .bold()
                                                
                                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                                    .offset(y:90)
                                                    .padding()
                                            )
                                            .sheet(isPresented: $carsheet) {
                                                car1()
                                            }
                                        
                                        
                                        
                                        
                                    }
                                    
                                  
                                    Button {
                                        amoledsheet.toggle()
                                        
                                    } label:
                                    {
                                        let imageURL_amoled=URL(string:imageURLString_amoled)
                                       /* AsyncImage(url: imageURL_amoled,content: { phase in
                                            if let image=phase.image{
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        Text("Amoled")
                                                            .font(.custom("teko",size:25))
                                                            .foregroundColor(Color(.white))
                                                            .bold()
                                                        
                                                            .frame(maxWidth:.infinity,alignment: .trailing)
                                                            .offset(y:90)
                                                            .padding()
                                                    )
                                                
                                                    .sheet(isPresented: $amoledsheet) {
                                                        amoled()
                                                    }
                                                
                                                
                                                
                                                
                                            }
                                            
                                            else if (phase.error != nil){
                                                Text("Error loading Image From Server")
                                                    .foregroundColor(Color("borderclr"))
                                                
                                                
                                            }
                                            
                                            else{
                                                ProgressView("Loading...")
                                                
                                                
                                                
                                                
                                            }
                                        }
                                                   
                                        )*/
                                        KFImage(imageURL_amoled)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                            
                                            .overlay(
                                                Text("AMOLED")
                                                    .font(.custom("teko",size:25))
                                                    .foregroundColor(Color(.white))
                                                    .bold()
                                                
                                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                                    .offset(y:90)
                                                    .padding()
                                            )
                                        
                                            .sheet(isPresented: $amoledsheet) {
                                                amoled()
                                            }
                                              
                                                   
                                                   
                                        
                                        
                                        
                                    }
                                    
                                 
                                    
                                    
                                    
                                    Button {
                                        naturesheet.toggle()
                                        
                                    } label:
                                    {
                                        let imageURL_nature=URL(string:imageURLString_nature)
                                       /* AsyncImage(url: imageURL_amoled,content: { phase in
                                            if let image=phase.image{
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .cornerRadius(15)
                                                    .overlay(
                                                        Text("NATURE")
                                                            .font(.custom("teko",size:25))
                                                            .foregroundColor(Color(.white))
                                                            .bold()
                                                        
                                                            .frame(maxWidth:.infinity,alignment: .trailing)
                                                            .offset(y:75)
                                                            .padding()
                                                    )
                                                
                                                    .sheet(isPresented: $naturesheet) {
                                                        nature()
                                                    }
                                                
                                                
                                                
                                                
                                            }
                                            
                                            else if (phase.error != nil){
                                                Text("Error loading Image From Server")
                                                    .foregroundColor(Color("borderclr"))
                                                
                                                
                                            }
                                            
                                            else{
                                                ProgressView("Loading...")
                                                
                                                
                                                
                                                
                                            }
                                        }
                                                   
                                        )*/
                                        KFImage(imageURL_nature)
                                        .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                            
                                            .overlay(
                                                Text("NATURE")
                                                    .font(.custom("teko",size:25))
                                                    .foregroundColor(Color(.white))
                                                    .bold()
                                                
                                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                                    .offset(y:75)
                                                    .padding()
                                            )
                                            .sheet(isPresented: $naturesheet) {
                                                nature()
                                            }
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                
                            }
                            
                        }
                    }
                    /* else{
                     ZStack{
                     
                     Text("No Internet found")
                     
                     }
                     }*/
                    
                }
                
                
                .padding()
                
            }
            /*else{
            nointernetview()
            }*/
            
            
        }
      //  }
        
    

        
        
struct mountain1:View{
   
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let url="https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/andreas-gucklhorn-mawU2PoJWfU-unsplash.jpg?alt=media&token=e133b060-c768-4c29-8e53-fd23ce44d1f1&_gl=1*188ln6l*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODQ4OTM3OS4xMC4xLjE2OTg0OTI3NzUuMTQuMC4w."
    let cache = ImageCache.default
  
    var body: some View{
        let url = URL(string: "https://example.com/image.jpg")
    
       
      
        VStack{
           // let image = UIImage(named: "default_profile_icon")
            LazyVGrid(columns:columns,spacing: 10){
                KFImage(URL(string: "https://firebasestorage.googleapis.com/v0/b/wallpaperapp-b34b4.appspot.com/o/andreas-gucklhorn-mawU2PoJWfU-unsplash.jpg?alt=media&token=e133b060-c768-4c29-8e53-fd23ce44d1f1&_gl=1*188ln6l*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5ODQ4OTM3OS4xMC4xLjE2OTg0OTI3NzUuMTQuMC4w."))
                    .resizable()
                    .cacheOriginalImage()
                   
                
                    .placeholder {
                        Image(systemName: "house")
                    }
          
                KFImage(URL(string: "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202002/croma_660_210220115524.jpg"))
                .resizable()
                //.retry(maxCount: 2)
                .cacheOriginalImage()
                .placeholder {
                   ProgressView()
                }
                
                
                
                
               
                        //.scaledToFit()
                        
                    
                    
                    
                    
                    
                    
                    
                    
                
                
            }
            
            .padding()
        }
  
    }
   
}
                                       
        
        struct car1:View{
            var body: some View{
                VStack{
                    Image(systemName: "house")
                }
            }
        }
        
        struct amoled:View{
            var body: some View{
                VStack{
                    ProgressView()
                    Image(systemName: "iphone")
                }
            }
        }
        
        struct nature:View{
           // @Environment(\.presentationMode) var presentationmode1
            var body: some View{
                VStack{
                    Image(systemName: "globe")
                
                    
                }
            }
        }
        
        struct settings:View{
           @Environment(\.presentationMode) var presentationMode
            @State private var showalert=false
             @StateObject var authManager = AuthManager.shared
             @State private var deletionError: Error?
            @State private var showalert1 = false
            @State private var onbaordshow=false
          
           
            
            var body: some View{
                
                
                NavigationStack {
                    ZStack
                    {
                        List{
                            
                            HStack{
                                Text("Developer:")
                                Spacer()
                                Text("aaryan")
                                
                            }
                            
                            HStack {
                                Text("App Version:")
                                Spacer()
                                Text("1.0")
                            }
                            
                            
                            Button {
                                if let emailurl=URL(string: "mailto:aaryanprabhakar07@gmail.com"){
                                    UIApplication.shared.open(emailurl)
                                    
                                } }label: {
                                    Text("Contact Us")
                                        .foregroundColor(Color("borderclr"))
                                    
                                    
                                }
                            Button(action: {
                                KingfisherManager.shared.cache.clearMemoryCache()
                                KingfisherManager.shared.cache.clearDiskCache {
                                    // Optionally, handle completion if needed
                                    print("Cache cleared.")
                                }
                            }) {
                                Text("Clear Cache")
                                    .foregroundColor(Color("borderclr"))
                                
                                
                            }
                            Button {
                                //logoutAndCloseApp()
                                
                                authManager.deleteAccount{ error in
                                    deletionError=error
                                    if error==nil{
                                        print("no error found")
                                    }
                                    
                                    
                                    
                                }
                                showalert1=true
                                
                                
                            } label: {
                                Text("Delete Account")
                                
                                    .foregroundColor(Color("borderclr"))
                                
                                
                            }
                            
                             if let error = deletionError {
                             Text(" Error: \(error.localizedDescription)")
                             
                             }
                           
                            
                        }
                        .alert(isPresented:$showalert1){
                             Alert(title:Text("Delete Account"),
                         message: Text("Your Account will be deleted from Firebase"),
                                   dismissButton: .default(Text("Ok")){
                                 navigateonbaord()
                             }
                             )
                         }
                        NavigationLink(
                            destination:signupview(),
                            isActive: $onbaordshow,
                            label: {
                                EmptyView()
                            }
                        )
                        
                        VStack {
                            Spacer()
                            Button {
                                
                                showalert=true
                                //logoutAndCloseApp()
                                //onbaordshow=true
                                
                                
                                
                                
                                
                            } label: {
                                Text("Log Out")
                                
                                    .bold()
                                    .padding()
                                    .frame(maxWidth:.infinity)
                                
                                    .background(Color("borderclr"))
                                    .foregroundColor(Color("txt"))
                                    .cornerRadius(50)
                                
                            }
                            .alert(isPresented:$showalert){
                                Alert(title: Text("Logout"),
                                      message: Text("Are you sure you want to log out"),
                                      primaryButton:.default(Text("Logout")){
                                    logoutAndCloseApp()
                                },secondaryButton: .cancel()
                                )
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        .padding()
                        
                        
                      
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                   
                    
                    
                }
            
            }
            
             
                
                 
             
            
                    
                    
                    
                

            
            func logoutAndCloseApp() {
                    do {
                        try Auth.auth().signOut()
                        // You've successfully logged out, now close the app
                        presentationMode.wrappedValue.dismiss()
                    } catch let error as NSError {
                        print("Error logging out: \(error)")
                        // Handle any errors that occur during logout
                    }
                }
            func navigateonbaord(){
                onbaordshow=true
            }
         
           
            }

            
                
                
            
        
        struct trending:View{
            var body: some View{
                ZStack{
                    VStack{
                        Text("coming soon")
                    }
                }
                
            }
        }
        
        
        struct signupview:View{
            @State private var email:String=""
            @State private var password:String=""
            @State private var isaccountcreated=false
            @State private var userGmail: String?
            @State private var showAlert = false
            @State private var showLoginView = false
            @State private var errorMessage: String?
            @State private var alreadyloginview = false
            @State private var iserrorMessage = false
       
            var body: some View{
                ZStack{
                    NavigationStack {
                        VStack{
                            Spacer()
                            //Text("hello world")
                            
                            Text("Welcome To FreeWalls")
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            
                            //  .frame(maxWidth:.infinity,alignment: .center)
                            
                            
                            
                                .font(.custom("anton", size: 36))
                            
                            
                            
                            TextField("email",text:$email)
                                .autocapitalization(.none)
                                .padding()
                            
                                .foregroundColor(Color("borderclr"))
                            
                            
                                .border(Color("borderclr"))
                            
                            
                                .padding(.bottom,20)
                            
                            
                            
                            
                            
                            SecureField("password",text: $password)
                                .autocapitalization(.none)
                                .textCase(.lowercase)
                                .padding()
                                .foregroundColor(Color("borderclr"))
                                .border(Color("borderclr"))
                                .padding(.bottom,20)
                            /*NavigationLink(destination: nointernetview(), isActive: $isaccountcreated){
                             EmptyView()
                             }*/
                            
                            Button {
                                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                    if let error = error{
                                        errorMessage=error.localizedDescription
                                        //print(error)
                                        iserrorMessage=true
                                        //return
                                    }
                                    if let authResult = authResult{
                                        print(authResult)
                                        userGmail=authResult.user.email
                                        isaccountcreated=true
                                        showAlert = true
                                        
                                    }
                                    
                                    
                                    // ...
                                }
                                
                                
                                
                                
                                
                                
                                
                            } label: {
                                Text("Create Account")
                                    .bold()
                                    .padding()
                                
                                    .frame(maxWidth:.infinity)
                                
                                    .background(Color("borderclr"))
                                    .foregroundColor(Color("txt"))
                                    .cornerRadius(5)
                                
                                
                                
                            }
                            
                            .alert(isPresented: $iserrorMessage) {
                                Alert(
                                    title: Text("Invalid Credentials"),
                                    message: Text(errorMessage ?? ""),
                                    dismissButton: .default(Text("OK")) {
                                        // showLoginView = true
                                    }
                                )
                            }
                            
                            
                            
                            Spacer()
                                .alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Account Created Successfully"),
                                        message: Text("Your account has been created."),
                                        dismissButton: .default(Text("OK")) {
                                            // Navigate to the login view after tapping "OK" in the alert
                                            showLoginView = true
                                        }
                                    )
                                }
                                .background(
                                    NavigationLink("", destination: loginview(), isActive: $showLoginView)
                                )
                            
                            
                        }
                       
                       
                        
                        
                       
                        
                        
                        
                        Button {
                            alreadyloginview.toggle()
                            
                            
                            
                        } label: {
                            Text("Already have an account? ").bold().foregroundColor(Color("borderclr"))+Text("Login")
                                .foregroundColor(Color.red).bold()
                        }
                        
                        
                    }
                    
                    
                    .padding()
                    NavigationLink("",destination: loginview(),isActive: $alreadyloginview)
                    
                    
                    
                    
                }
                
                .navigationBarBackButtonHidden(true)
                .padding()
            }
        }
        
        struct loginview:View{
            @State private var email:String=""
            @State private var password:String=""
            @State private var iserrorMessage=false
            @State private var islogindone=false
            @Environment(\.dismiss) private var dismiss
           // @StateObject private var userSettings=UserSettings()
            var body: some View{
                ZStack{
                    NavigationStack{
                        VStack{
                            Spacer()
                            Text("Welcome Back!")
                                .font(.custom("anton", size: 36))
                            
                            
                            TextField("email",text:$email)
                                .autocapitalization(.none)
                            
                                .padding()
                                .textCase(.lowercase)
                            
                                .foregroundColor(Color("borderclr"))
                            
                            
                                .border(Color("borderclr"))
                            
                            
                                .padding(.bottom,20)
                            
                            
                            
                            
                            
                            //TextField("password",text: $password)
                                SecureField("password",text: $password)
                                .autocapitalization(.none)
                                .padding()
                               
                                .foregroundColor(Color("borderclr"))
                                .border(Color("borderclr"))
                                .padding(.bottom,20)
                            
                            
                            Button {
                                
                                Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                                    if let error=error{
                                        iserrorMessage=true
                                        print(error)
                                        return
                                    }
                                    if let authResult=authResult{
                                        print(authResult)
                                        islogindone=true
                                        //userSettings.isLoggedIn=true
                                    }
                                    
                                }
                                
                            } label: {
                                Text("Log In")
                                    .bold()
                                    .padding()
                                
                                    .frame(maxWidth:.infinity)
                                
                                    .background(Color("borderclr"))
                                    .foregroundColor(Color("txt"))
                                    .cornerRadius(5)
                            }
                            
                            Spacer()
                                .alert(isPresented: $iserrorMessage) {
                                    Alert(
                                        title: Text("Invalid Credentials"),
                                        message: Text("Enter correct information."),
                                        dismissButton: .default(Text("OK")) {
                                            // showLoginView = true
                                        }
                                    )
                                }
                                .background(
                                    NavigationLink("", destination: homeview(), isActive: $islogindone)
                                )
                        }
                    }
                    .navigationBarBackButtonHidden()
                    .toolbar{
                        ToolbarItem(placement:.navigationBarLeading){
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward.circle")
                                    .foregroundColor(Color(.red))
                                    .bold()
                                    
                            }

                        }
                        
                    }
                    
                    
                    .padding()
                    
                }
            }
        }
        
        
    

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                //onboard()
                // homeview()
                //explore()
                //categories().environmentObject(NetworkMonitor())
                //environmentObject(NetworkMonitor)
                //signupview()
               //loginview()
                settings()
                //mountain1()
            }
        }


