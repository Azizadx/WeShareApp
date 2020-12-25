//
//  ContentView.swift
//  Weshare
//
//  Created by Nasrallah Hassan on 12/23/20.
//  Copyright © 2020 AzizaDeveloper. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercent = 2
    
    let percenttages = [10,15,20,25,0]
    
    
    var totalPerPerson: Double {
        let pC = Double(numberOfPeople) ?? 2
        let tS = Double(percenttages[tipPercent])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tS
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / pC
        
        return amountPerPerson
    }
    var totalAmount: Double {
        let orderAmount = Double(checkAmount) ?? 0
         let tS = Double(percenttages[tipPercent])
        let esimateAmount = orderAmount + tS
        return esimateAmount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip you want to leave")) {
                    
                    Picker("Tip percentage", selection: $tipPercent) {
                        ForEach(0 ..< percenttages.count) {
                            Text("\(self.percenttages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Etimate total amount" )) {
                    Text("\(totalAmount,specifier: "%.2f" ) Birr")

                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f") Birr")
                }
            }
            .navigationBarTitle("WeShare")
        }
        

  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
