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
struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "newspaper")
                        .font(.system(size:45))
                        .padding()
                    
                    Text("Welcome to News App")
                    
                        .bold()
                        .font(.title)
                    NavigationLink {
                        signupview()
                    }
                label: {
                    Text("Continue")
                    
                        .padding()
                        .frame(maxWidth:.infinity)
                        .bold()
                    
                    
                        .background(Color(.blue))
                        .foregroundColor(Color(.white))
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
        
        
        
        
        
        private var  imageURLString="https://firebasestorage.googleapis.com/v0/b/wallpaperxcode.appspot.com/o/john-towner-JgOeRuGD_Y4-unsplash.jpg?alt=media&token=e7b0e422-68f5-4ac1-874a-b6ff4c0d26fb&_gl=1*88uty4*_ga*MTgyMjE1NzkxNC4xNjk3OTY2Nzcx*_ga_CW55HF8NVT*MTY5Nzk2Njc3MC4xLjEuMTY5Nzk2Njg1NS42MC4wLjA."
        var body: some View{
            
            if(networkMonitor.isConnected){
                ZStack{
                    VStack(spacing: 0.0){
                        Text("Categories")
                            .font(.title)
                            .bold()
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding()
                        
                        VStack{
                            let imageURL=URL(string:imageURLString)
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns:columns,spacing: 20){
                                    Button {
                                        mountainsheet.toggle()
                                    } label: {
                                        AsyncImage(url: imageURL,content: { phase in
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
                                                Text("No Internet found please turn on internet and restart the app")
                                                    .foregroundColor(Color.black)
                                                
                                                
                                            }
                                            
                                            else{
                                                ProgressView("Loading...")
                                                
                                                
                                                
                                                
                                            }
                                        }
                                                   
                                        )
                                        
                                        
                                        
                                    }
                                    
                                
                                    
                                    
                                    Button {
                                        carsheet.toggle()
                                        
                                    } label: {
                                        Image("cars")
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
                                    }
                                    
                                    .sheet(isPresented: $carsheet) {
                                        car1()
                                    }
                                    
                                    
                                    
                                    Button {
                                        amoledsheet.toggle()
                                        
                                    } label: {
                                        Image("amoled")
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
                                    }
                                    
                                    .sheet(isPresented: $amoledsheet) {
                                        amoled()
                                    }
                                    
                                    
                                    
                                    Button {
                                        naturesheet.toggle()
                                        
                                    } label: {
                                        Image("nature")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                        
                                        
                                            .overlay(
                                                Text("Nature")
                                                    .font(.custom("teko",size:25))
                                                    .foregroundColor(Color(.white))
                                                
                                                    .bold()
                                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                                    .offset(y:85)
                                                    .padding()
                                            )
                                    }
                                    
                                    .sheet(isPresented: $naturesheet) {
                                        nature()
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
            else{
                nointernetview()
            }
            
            
        }
        }
        
    

        
        
        struct mountain1:View{
            var body: some View{
                VStack{
                    Image(systemName: "globe")
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
            var body: some View{
                VStack{
                    Image(systemName: "globe")
                }
            }
        }
        
        struct settings:View{
            
            var body: some View{
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
                        Text("Contact Us:")
                        
                    }
                    
                    
                }
                
                
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
                            
                            Text("Welcome Back!")
                            
                            
                            //  .frame(maxWidth:.infinity,alignment: .center)
                            
                            
                            
                                .font(.custom("anton", size: 36))
                            
                            
                            
                            TextField("email",text:$email)
                            
                                .padding()
                            
                                .foregroundColor(Color.black)
                            
                            
                                .border(.black)
                            
                            
                                .padding(.bottom,20)
                            
                            
                            
                            
                            
                            TextField("password",text: $password)
                                .padding()
                                .foregroundColor(Color.black)
                                .border(.black)
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
                                
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
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
                            Text("Already have an account? ").bold().foregroundColor(Color.black)+Text("Login")
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
            var body: some View{
                ZStack{
                    NavigationStack{
                        VStack{
                            Spacer()
                            Text("Welcome Back!")
                                .font(.custom("anton", size: 36))
                            
                            
                            TextField("email",text:$email)
                            
                                .padding()
                            
                                .foregroundColor(Color.black)
                            
                            
                                .border(.black)
                            
                            
                                .padding(.bottom,20)
                            
                            
                            
                            
                            
                            TextField("password",text: $password)
                                .padding()
                                .foregroundColor(Color.black)
                                .border(.black)
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
                                    }
                                    
                                }
                                
                            } label: {
                                Text("Log In")
                                    .bold()
                                    .padding()
                                
                                    .frame(maxWidth:.infinity)
                                
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
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
                    
                    
                    .padding()
                    
                }
            }
        }
        
        
    

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
               // ContentView()
                // homeview()
                //explore()
                //categories().environmentObject(NetworkMonitor())
                //environmentObject(NetworkMonitor)
                signupview()
                //loginview()
               // settings()
            }
        }


