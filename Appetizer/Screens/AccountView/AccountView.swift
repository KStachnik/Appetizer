//
//  AccountView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var vm = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    TextField("First Name", text: $vm.user.firstName)
                    TextField("Last Name", text: $vm.user.lastName)
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday",
                               selection: $vm.user.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        vm.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                    
                }
                
                Section(header: Text("Request")) {
                    Toggle("Extra Napkins", isOn: $vm.user.extraNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Frequent Reffils", isOn: $vm.user.frequentRefills)
                        
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🤷🏻Account")
        }
        .onAppear {
            vm.retrieveUser()
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dissmissButton)
        }
    }
}

#Preview {
    AccountView()
}
