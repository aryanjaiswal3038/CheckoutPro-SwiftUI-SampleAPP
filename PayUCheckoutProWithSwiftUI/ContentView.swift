//
//  ContentView.swift
//  PayUCheckoutProWithSwiftUI
//
//  Created by Rishabh Jaiswal on 20/02/23.
//

import SwiftUI
import PayUCheckoutProKit
import PayUCheckoutProBaseKit
import PayUParamsKit
import PayUBizCoreKit
import PayULoggerKit
import UIKit

let KscreenWidth = UIScreen.main.bounds.width
let Kscreenheight = UIScreen.main.bounds.height
var alertValue = ""
let keySalt = [["3TnMpV", "g0nGFe03", Environment.production],
               ["gtKFFx", "4R38IvwiV57FwVpsgOvTXBdLE4tHUXFW", Environment.test]]
let indexKeySalt = 1
@available(iOS 16.0, *)
struct ContentView: View {
    
       @State var labelWidth: CGFloat? = nil
       @State var key = keySalt[indexKeySalt][0] as? String ?? ""
       @State var salt = keySalt[indexKeySalt][1] as? String ?? ""
      // @State var  presentAlert1 = presentAlert
       @State var amount = "1"
       @State var productInfo = "Nokia"
       @State var surl = "https://payu.herokuapp.com/ios_success"
       @State var furl = "https://payu.herokuapp.com/ios_success"
       @State var firstName = "Umang"
       @State var email = "umang@arya.com"
       @State var phone = "8700908382"
       @State var userCredntials = "umang:arya123"
       @State var transactionID = Utils.txnId()
       @State var merAccessKey = "E5ABOXOWAAZNXB6JEF5Z"
       @State var merSecretKey = "e425e539233044146a2d185a346978794afd7c66"
       @State var sodexoSourceID = "src_b0d97b32-3900-421a-bc25-5c9924dbc171"
       @State var sodexoCardBalanceAPITimeout = "4"
       @State var primaryColor = "#25272C"
       @State var secondaryColor = "#ffffff"
       @State var merchantName = "Gabbar"
       @State var logoName = "Logo"
       @State var recurringAmount = "1"
       @State var billingInterval = "1"
       @State var billingCycle = ""

     
    @State var paymentStartDate = Date()
    @State var paymentEndDate = Date()
       @State var remarks = ""

       @State var enableNativeOtp = false
       @State var cancelDialogL1 = false
       @State var cancelDialogOnPaymentScreen = false
       @State var enableSplitPay = false
       @State var splitPayRequest = "{\"type\":\"absolute\",\"splitInfo\":{\"imAJ7I\":{\"aggregatorSubTxnId\":\"Testchild123\",\"aggregatorSubAmt\":\"5\"},\"qOoYIv\":{\"aggregatorSubTxnId\":\"Testchild098\",\"aggregatorSubAmt\":\"5\"}}}"
       @State var orderDetails = "[{\"GST\":\"5%\"},{\"Delivery Date\":\"25 Dec\"},{\"Status\":\"In Progress\"}]"
       @State var l1Oprions = "[{\"NetBanking\":\"\"},{\"BNPL\":\"\"},{\"EMI\":\"\"},{\"UPI\":\"TEZ\"},{\"Wallet\":\"PHONEPE\"}]"
       @State var offerKey = "[{\"NetBanking\":\"\"},{\"BNPL\":\"\"},{\"EMI\":\"\"},{\"UPI\":\"TEZ\"},{\"Wallet\":\"PHONEPE\"}]"
       @State var customNotes = "[{\"Hi, This is a custom note for payment modes.\":[]},{\"Hi, This is a custom note for payment options.\":[\"Cards\",\"NetBanking\",\"upi\",\"Wallet\",\"Sodexo\",\"NeftRtgs\",\"EMI\",\"SavedCard\"]}]"
    
       @State var offerUserToken = "umang:arya123"
       @State var surlTimeout = "4"
       @State var environment = Utils.stringyfy(environment: keySalt[indexKeySalt][2])
       @ObservedObject var delegate = PayUCheckoutProDelegateClass(salt: "4R38IvwiV57FwVpsgOvTXBdLE4tHUXFW")
       @State private var isDisplayed = false
       @State private var isNetBanking = false
       @State private var isCards = false
       @State private var isEMI = false
       @State private var isUPI = false
       @State private var isWallet = false
       @State private var autoOtpSelect = false
       @State private var autoOtpSubmit = false
       @State private var si = false
       @State var ccdc = ""
      
       @State private var showingAlert = false
    
  //  @ObservedObject var del =

       var recurringPeriod: PayUBillingCycle = .monthly



    var body: some View {
        

        
        ScrollView{
            Text("CheckOut Pro SDK Sample APP in SWIFTUI").bold()
                .font(.system(size: 30, weight: .light, design: .rounded))
                .frame(width: KscreenWidth - 20)
                .multilineTextAlignment(.center)


            VStack(){
                
                HStack{
                    Text("Key")
                    Spacer()
                    TextField("Key", text: $key)
                        .frame(width: KscreenWidth/2.35, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
            
                    Menu {
                        Button {
                            //action here
                            key = "gtKFFx"
                            salt = "4R38IvwiV57FwVpsgOvTXBdLE4tHUXFW"
                            environment = "Test"
                        } label: {
                            Text("gtKFFx , Test")
                        }
                        Button {
                            //action here
                            key = "QyT13U"
                            salt = "UnJ0FGO0kt3dUgnHo9Xgwi0lpipBV0hB"
                            environment = "Test"
                        } label: {
                            Text("QyT13U , Test")
                            
                        }
                        Button {
                            //action here
                            key = "smsplus"
                            salt = "1b1b0"
                            environment = "Production"
                        } label: {
                            Text("smsplus , Production")
                            
                        }
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: KscreenWidth/17, height: Kscreenheight/17, alignment: .center)
                    }
                    .buttonStyle(.plain)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Salt")
                    Spacer()
                    TextField("Salt", text: $salt)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Amount")
                    Spacer()
                    TextField("Amount", text: $amount)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Product Info")
                    Spacer()
                    TextField("Product Info", text: $productInfo)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("SURL")
                    Spacer()
                    TextField("SURL", text: $surl)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("FURL")
                    Spacer()
                    TextField("Furl", text: $furl)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("First Name")
                    Spacer()
                    TextField("First Name", text: $firstName)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Email")
                    Spacer()
                    TextField("Email", text: $email)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Phone")
                    Spacer()
                    TextField("Phone", text: $phone)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("env")
                    Spacer()
                    TextField("environment", text: $environment)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
           
            }
            .padding(.trailing, 25)
            
        
            VStack(){
                
                
                HStack{
                    Text("User Credentials")
                    Spacer()
                    TextField("User Credentials", text: $userCredntials)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                
                HStack{
                    Text("Txn ID")
                    Spacer()
                    TextField("Transaction ID", text: $transactionID)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Mer. Access Key")
                    Spacer()
                    TextField("Mer. Access Key", text: $merAccessKey)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                
                HStack{
                    Text("Mer. Secret Key")
                    Spacer()
                    TextField("Mer. Secret Key", text: $merSecretKey)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Sodexo Source ID")
                    Spacer()
                    TextField("Sodexo Source ID", text: $sodexoSourceID)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                HStack{
                    Text("Sodexo Card Balance API Timeout")
                    .padding(.trailing, 10)
                    Spacer()
                    TextField("Sodexo Card Balance API Timeout", text: $sodexoCardBalanceAPITimeout)
                        .frame(width: KscreenWidth/1.8, height: 90)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                Text("Customizations")
                    .font(.system(size: 18, weight: .bold, design: .serif))

                HStack{
                    Text("Primary Color")
                    Spacer()
                    TextField("Primary Color", text: $primaryColor)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
          
                
            }
            .padding(.trailing, 25)
            
            
            VStack{
                HStack{
                    Text("Secondary Color")
                    Spacer()
                    TextField("Secondary Color", text: $secondaryColor)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack{
                    Text("Merchant Name")
                    Spacer()
                    TextField("Merchant Name", text: $merchantName)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Logo Name")
                    Spacer()
                    TextField("Logo Name", text: $logoName)
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                    
                    
                }
                .padding(.horizontal, 20)
                
                Toggle("Enable Native OTP", isOn: $enableNativeOtp)
                    .onChange(of: enableNativeOtp) { value in
                        // action...
                        print(value)
                    }
                    .padding()
                    .frame(width: KscreenWidth, height: 50)
                
                Toggle("Show Cancel Dialog on L1", isOn: $cancelDialogL1)
                    .onChange(of: cancelDialogL1) { value in
                        // action...
                        print(value)
                    }
                    .padding()
                    .frame(width: KscreenWidth, height: 50)
                
                Toggle("Show Cancel Dialog on Payment Screen", isOn: $cancelDialogOnPaymentScreen)
                    .onChange(of: cancelDialogOnPaymentScreen) { value in
                        // action...
                        print(value)
                    }
                    .padding()
                    .frame(width: KscreenWidth, height: 50)
                
                Toggle("Enable SplitPay", isOn: $enableSplitPay)
                    .onChange(of: enableSplitPay) { value in
                        // action...
                        print(value)
                    }
                    .padding()
                    .frame(width: KscreenWidth, height: 50)
                if enableSplitPay == true{
                    HStack{
                        Text("Split Request")
                        Spacer()
                        TextField("Split Request", text: $splitPayRequest )
                            .frame(width: KscreenWidth/1.8, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                        
                        
                    }
                    .padding(.horizontal, 20)
                }
                
                
                Toggle("Enable Enforcement", isOn: $isDisplayed)
                    .onChange(of: isDisplayed) { value in
                        // action...
                        print(value)
                    }
                    .padding()
                    .frame(width: KscreenWidth, height: 50)
                
                if isDisplayed == true{
                    
                    Toggle("Enforce NetBanking", isOn: $isNetBanking)
                        .onChange(of: isNetBanking) { value in
                            // action...
                            print(value)
                        }
                        .padding()
                        .frame(width: KscreenWidth, height: 50)
                    
                    Toggle("Enforce Cards", isOn: $isCards)
                        .onChange(of: isCards) { value in
                            // action...
                            print(value)
                        }
                        .padding()
                        .frame(width: KscreenWidth, height: 50)
                    
                    TextField("Credit/Debit", text: $ccdc)
                        .padding()
                        .frame(width: KscreenWidth - 50, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Toggle("Enforce EMI", isOn: $isEMI)
                        .onChange(of: isEMI) { value in
                            // action...
                            print(value)
                        }
                        .padding()
                        .frame(width: KscreenWidth, height: 50)
                    
                    Toggle("Enforce UPI", isOn: $isUPI)
                        .onChange(of: isUPI) { value in
                            // action...
                            print(value)
                        }
                        .padding()
                        .frame(width: KscreenWidth, height: 50)
                    
                    Toggle("Enforce Wallet", isOn: $isWallet)
                        .onChange(of: isWallet) { value in
                            // action...
                            print(value)
                        }
                        .padding()
                        .frame(width: KscreenWidth, height: 50)
                }
                
                
            }
            .padding(.trailing, 25)
            
            VStack{
                
                HStack{
                    Text("Order Details")
                    .padding(.trailing, 10)
                    Spacer()
                    TextField("Order Details", text: $orderDetails, axis: .vertical)
                        .lineLimit(3)
                        .frame(width: KscreenWidth/1.8, height: 90)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("L1 Options")
                    .padding(.trailing, 10)
                    Spacer()
                    TextField("L1 Options", text: $l1Oprions, axis: .vertical)
                        .lineLimit(3)
                        .frame(width: KscreenWidth/1.8, height: 90)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Offer Key")
                    .padding(.trailing, 10)
                    Spacer()
                    TextField("Offer Key", text: $offerKey, axis: .vertical)
                        .lineLimit(3)
                        .frame(width: KscreenWidth/1.8, height: 90)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                
                HStack{
                    Text("Custom Notes")
                    .padding(.trailing, 10)
                    Spacer()
                    TextField("Custom Notes", text: $customNotes, axis: .vertical)
                        .lineLimit(4)
                        .frame(width: KscreenWidth/1.8, height: 120)
                        .lineLimit(2)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
            
            
            Text("CB Customizations")
                .font(.system(size: 18, weight: .bold, design: .serif))
            
            Toggle("Auto OTP Select", isOn: $autoOtpSelect)
                .onChange(of: isNetBanking) { value in
                    // action...
                    print(value)
                }
                .padding(.leading, 20)
                .frame(width: KscreenWidth, height: 50)
            
            Toggle("Auto OTP Submit", isOn: $autoOtpSubmit)
                .onChange(of: isCards) { value in
                    // action...
                    print(value)
                }
                .padding(.leading, 20)
                .frame(width: KscreenWidth, height: 50)
            
            
            HStack{
                Text("Offer User Token")
                .padding(.trailing, 10)
                Spacer()
                TextField("Offer User Token", text: $offerUserToken)
                    .frame(width: KscreenWidth/1.8, height: 45)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .frame(maxWidth: 200)
                 
                
            }
            .padding(.horizontal, 20)
            
            
            
            HStack{
                Text("SURL/FURL Timeout")
                Spacer()
                .padding()
                TextField("SURL/FURL Timeout", text: $surlTimeout)
                    .frame(width: KscreenWidth/1.8, height: 45)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .frame(maxWidth: 200)
                 
                
            }
            .padding(.horizontal, 20)
                
              
                
            }
            .padding(.trailing, 25)
            
            VStack{
                
                Toggle("SI", isOn: $si)
                    .onChange(of: si) { value in
                        // action...
                        print(value)
                    }
                    .padding(.leading, 20)
                    .frame(width: KscreenWidth, height: 50)
                
                HStack{
                    Text("Recurring Amount")
                    Spacer()
                    TextField("Recurring Amount", text: $recurringAmount )
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Billing Interval")
                    Spacer()
                    TextField("Billing Interval", text: $billingInterval )
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Billing Cycle")
                    Spacer()
                    Menu(billingCycle.count == 0 ? "ONCE" : billingCycle) {
                        Button("ONCE", action: {billingCycle = "ONCE"})
                        Button("DAILY", action: {billingCycle = "DAILY"})
                        Button("WEEKLY", action: {billingCycle = "WEEKLY"})
                        Button("MONTHLY", action: {billingCycle = "MONTHLY"})
                        Button("YEARLY", action: {billingCycle = "YEARLY"})
                        Button("ADHOC", action: {billingCycle = "ADHOC"})
                          }
                    .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Payment Start Date")
                    Spacer()
                  //  TextField("Payment Start Date", text: $paymentStartDate )
                    DatePicker(selection: $paymentStartDate, in: Date.now..., displayedComponents: .date) {
                        Text("date")
                    }
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Payment End Date")
                    Spacer()
                 //   TextField("Payment End Date", text: $paymentEndDate )
                    DatePicker(selection: $paymentEndDate, in: Date.now..., displayedComponents: .date) {
                        Text("date")
                    }
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Text("Remarks")
                    Spacer()
                    TextField("Remarks", text: $remarks )
                        .frame(width: KscreenWidth/1.8, height: 45)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                     
                    
                }
                .padding(.horizontal, 20)
                
                
                
                Button(action: {
                    openCheckoutPro()
                }) {
                    Text("Open CheckoutPro")
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.trailing, 25)

        }
        .alert(item: $delegate.response, content: { err in
            
            Alert(title: Text("alert"), message: Text(err.data))

        })
//        .alert(isPresented: $delegate.showAlert, content: {
//
//         //   Alert(title: Text("alert"), message: Text())
//        })
        .onTapGesture {

              self.endTextEditing()
        }
    }
    
    func openCheckoutPro() {
        let payUConfig = PayUCheckoutProConfig()
        payUConfig.merchantName = merchantName;
        payUConfig.cartDetails = cartDetails();
        payUConfig.customNotes = getCustomNotes();
        payUConfig.autoSelectOtp = autoOtpSelect;
        payUConfig.autoSubmitOtp = autoOtpSubmit;
        payUConfig.paymentModesOrder = getPreferredPaymentMode();
        
        let merchantResponseTimeoutStr: String = surlTimeout
          if let merchantResponseTimeout = TimeInterval(merchantResponseTimeoutStr) {
            payUConfig.merchantResponseTimeout = merchantResponseTimeout
        }
        
        
        if let primary = Utils.hexStringToUIColor(hex: primaryColor ), let secondary = Utils.hexStringToUIColor(hex: secondaryColor ) {
            payUConfig.customiseUI(primaryColor: primary, secondaryColor: secondary)
        }
        payUConfig.merchantLogo = UIImage(named: logoName);
//        payUConfig.paymentModesOrder = [self getPreferredPaymentMode];
        if isDisplayed == true{
            payUConfig.enforcePaymentList = getEnforcePaymentModesList() //"CARD", "UPI", "WALLET", "EMI",
        }
        payUConfig.autoSelectOtp = true;
        payUConfig.merchantResponseTimeout = 8;
        payUConfig.showExitConfirmationOnPaymentScreen = cancelDialogOnPaymentScreen
        payUConfig.showExitConfirmationOnCheckoutScreen = cancelDialogL1
        

        let paymentParam = PayUPaymentParam(
            key: key,
            transactionId: Utils.txnId(),
            amount: amount,
            productInfo: productInfo,
            firstName: firstName,
            email: email,
            phone: phone,
            surl: surl,
            furl: furl,
            environment: Utils.environment(environment: environment )
        )
        
        paymentParam.userCredential = userCredntials
        paymentParam.userToken = "test"
        paymentParam.enableNativeOTP = enableNativeOtp
        if enableSplitPay == true{
            paymentParam.splitPaymentDetails = splitPayRequest
        }
        paymentParam.userToken = offerUserToken
        
        if si == true{
           let siInfo =  PayUSIParams.init(billingAmount: recurringAmount, paymentStartDate: paymentStartDate, paymentEndDate: paymentEndDate, billingCycle: recurringPeriod, billingInterval: NSNumber(value: Int(billingInterval) ?? 0))
            siInfo.remarks = remarks.isEmpty ? nil : remarks
            siInfo.isFreeTrial = true
            siInfo.billingLimit = "ON"
            siInfo.billingRule = "MAX"
            paymentParam.siParam = siInfo

        }
        
        PayULog.shared.logLevel = .verbose
        //delegate = PayUCheckoutProDelegateClass(salt: salt)
        PayUCheckoutPro.open(on: rootViewController!, paymentParam: paymentParam, config: payUConfig, delegate: delegate)
    }
    
    func cartDetails() -> [[String: String]]? {
        if let cartDetails = Utils.JSONFrom(string: orderDetails) as? [[String : String]] {
            return cartDetails
        }
        return nil
    }
    
    
    func getPreferredPaymentMode() -> [PaymentMode]? {
        if let preferredPaymentModesJSON = Utils.JSONFrom(string: l1Oprions) as? [[String : String]] {
            var preferredPaymentModes: [PaymentMode] = []
            for eachPreferredPaymentMode in preferredPaymentModesJSON {
                if let paymentMode = Utils.paymentModeFrom(paymentType: eachPreferredPaymentMode.keys.first?.lowercased(), paymentOptionID: eachPreferredPaymentMode.values.first) {
                    preferredPaymentModes.append(paymentMode)
                }
            }
            return preferredPaymentModes
        }
        return nil
    }
    
    
    func getCustomNotes() -> [PayUCustomNote]? {
        if let notesJSON = Utils.JSONFrom(string: customNotes) as? [[String: Any]] {
            var customNotes = [PayUCustomNote]()
            for json in notesJSON {
                for (key, value) in json {
                    if let paymentModes = (value as? [String])?.compactMap({ Utils.paymentTypeFrom(paymentType: $0)}) {
                        let customNote = PayUCustomNote()
                        customNote.note = key
                        customNote.noteCategories =  paymentModes
                        customNotes.append(customNote)
                    }
                }
            }
            return customNotes
        }
        return nil
    }
    
    
    func getEnforcePaymentModesList() -> [[String: Any]]? {
        var enforcePaymentList = [[String: Any]]()
        
        var nbEnforcement = [String: Any]()
        nbEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.nb
        
        var ccdcEnforcement = [String: Any]()
        ccdcEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.card
        
//        if let cardType = ccdc, !cardType.isEmpty {
//            let cardType = cardType.uppercased() == PaymentParamConstant.cc ? PaymentParamConstant.cc : PaymentParamConstant.dc
//            ccdcEnforcement[PaymentParamConstant.cardType] = cardType
//        }
        
        var upiEnforcement = [String: Any]()
        upiEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.upi
        
        var walletEnforcement = [String: Any]()
        walletEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.wallet
        
        var emiEnforcement = [String: Any]()
        emiEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.emi
        
        var neftRtgsEnforcement = [String: Any]()
        neftRtgsEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.neftrtgs
        
        var sodexoEnforcement = [String: Any]()
        sodexoEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.sodexo
        
        var bnplEnforcement = [String: Any]()
        bnplEnforcement[PaymentParamConstant.paymentType] = PaymentParamConstant.bnpl
        
        
        if isNetBanking == true {
            enforcePaymentList.append(nbEnforcement)
        }
        
        if isCards == true {
            enforcePaymentList.append(ccdcEnforcement)
        }
        
        if isUPI == true {
            enforcePaymentList.append(upiEnforcement)
        }
        
        if isWallet == true {
            enforcePaymentList.append(walletEnforcement)
        }
        
        if isEMI == true {
            enforcePaymentList.append(emiEnforcement)
        }
        
        return enforcePaymentList
    }
    var currentKeyWindow: UIWindow? {
      UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter { $0.isKeyWindow }
        .first
    }

    var rootViewController: UIViewController? {
      currentKeyWindow?.rootViewController
    }

}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
class Response: Identifiable{
    var data: String
    
    init(data: String){
        self.data = data
    }
    
}
    class PayUCheckoutProDelegateClass: PayUCheckoutProDelegate, ObservableObject {
        
       @Published var showAlert = false
        @Published var response: Response?
        
        let salt: String
        init(salt: String) {
            self.salt = salt
        }


        func onError(_ error: Error?) {
            // handle error scenario
            print("error\n",error ?? "")
            response = Response(data: error?.localizedDescription ?? "")
            showAlert = true
        }

        
        func onPaymentSuccess(response: Any?) {
            // handle success scenario
            print("response\n",response ?? "")
            self.response = Response(data: response as? String ?? "Success")
            showAlert = true
           
        }
        
        func onPaymentFailure(response: Any?) {
            // handle failure scenario
            print("response\n",response ?? "")
            self.response = Response(data: response as? String ?? "failure")
            showAlert = true
        }
        
        func onPaymentCancel(isTxnInitiated: Bool) {
            // handle txn cancelled scenario
            // isTxnInitiated == YES, means user cancelled the txn when on reaching bankPage
            // isTxnInitiated == NO, means user cancelled the txn before reaching the bankPage
            let completeResponse = "isTxnInitiated = \(isTxnInitiated)"
            //            showAlert(title: "Cancelled", message: "\(completeResponse)")
            print(completeResponse)
            response = Response(data: "cancel")
            showAlert = true
        }
        
        
        func generateHash(for param: DictOfString, onCompletion: @escaping PayUHashGenerationCompletion) {
            let commandName = (param[HashConstant.hashName] ?? "")
            let hashStringWithoutSalt = (param[HashConstant.hashString] ?? "")
            let postSalt = param[HashConstant.postSalt]
            // get hash for "commandName" from server
            // get hash for "hashStringWithoutSalt" from server
            
            // After fetching hash set its value in below variable "hashValue"
            var hashValue = ""
            if let hashType = param[HashConstant.hashType], hashType == HashConstant.V2 {
                hashValue = PayUDontUseThisClass.hmacSHA256(hashStringWithoutSalt, withKey: salt)
            } else if commandName == HashConstant.mcpLookup {
                hashValue = Utils.hmacsha1(of: hashStringWithoutSalt, secret: "secret_key")
            } else if let postSalt = postSalt {
                let hashString = hashStringWithoutSalt + salt + postSalt
                hashValue = Utils.sha512Hex(string: hashString)
            } else {
                hashValue = Utils.sha512Hex(string: (hashStringWithoutSalt + salt))
            }
            onCompletion([commandName : hashValue])
        }
            
        
    }
    

   
extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
