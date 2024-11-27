//
//  LandingView.swift
//  UberEats_SwiftUI
//
//  Created by Anant Prajapati on 11/11/24.
//

import SwiftUI
import CountryPicker

struct LandingView: View {
    
    @State private var country : Country?
    @State private var showCountryPicker = false
    @State private var phoneNumber = ""
    @State private var navigateToPhoneInput = false

    var body: some View {
        //MARK: -Image
        NavigationView{
            VStack{
                Image("UEImg")
                    .resizable()
                    .scaledToFit()
                //MARK: - Label
                HStack {
                    Text("Use your uber account to get started off")
                        .font(.system(size: 25,weight: .medium,design: .default))
                    Spacer()
                }
                .padding(.horizontal,15)
                //MARK: -CountryPicker
                HStack {
//                    CountryPickerView()
                    HStack(spacing:10){
                        //MARK: -CountryFlag
                        if let country = country{
                            Text(country.isoCode.getFlag())
                                .font(.largeTitle)
                        
                        }else{
                           
                            Text("IN".getFlag())
                                .font(.largeTitle)
                        }
                        
                        //MARK: CountryCode
                        Text(country?.phoneCode ?? "91")
                        
                        //MARK: -CountryDropDownButton
                        Button{
                            print("ButtonPressed")
                            showCountryPicker = true
                        }label: {
                            Image("DropDown")
                                .frame(width: 30, height: 30)
                        }
                        .sheet(isPresented: $showCountryPicker) {
                            CountryPicker(selectedCountry: $country)
                            
                        }
                        
                        Divider()
                            .frame(width:1,height: 30)
                            .overlay(Color.white)
                        
                        //MARK: -MobileNumber
                        
                        TextField("232 188 7651", text: $phoneNumber)
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                navigateToPhoneInput = true
                            }
                        Spacer()
                    }
                    .padding()
                    .frame(height: 60)
                    .background(Color(.systemGray6))
                    .background(
                        NavigationLink(destination: PhoneInputView(iscountry: $country), isActive: $navigateToPhoneInput) {

                        }
                    )
                }
               
                .padding()
                Spacer()
            }
        }
    }
}


#Preview {
    LandingView()
}
