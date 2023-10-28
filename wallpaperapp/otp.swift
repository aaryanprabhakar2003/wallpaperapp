//
//  otp.swift
//  wallpaperapp
//
//  Created by Aaryan Prabhakar on 28/10/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct OTPView: View {
    @State private var phoneNumber = ""
    @State private var verificationCode = ""
    @State private var isCodeSent = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            if !isCodeSent {
                TextField("Enter your phone number", text: $phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send OTP") {
                    // Send OTP code to the provided phone number
                    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                        if let error = error {
                            alertMessage = "Error: \(error.localizedDescription)"
                        } else {
                            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                            isCodeSent = true
                        }
                    }
                }
            } else {
                TextField("Enter OTP code", text: $verificationCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Verify OTP") {
                    // Verify the OTP code
                    if let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") {
                        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
                        Auth.auth().signIn(with: credential) { (authResult, error) in
                            if let error = error {
                                alertMessage = "Error: \(error.localizedDescription)"
                            } else {
                                alertMessage = "Authentication successful!"
                            }
                        }
                    }
                }
            }
        }
        .padding()
        /*.alert(isPresented: $alertMessage != "") {
            Alert(title: Text("Authentication Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }*/
    }
}


struct otp_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
