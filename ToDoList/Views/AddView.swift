//
//  AddView.swift
//  ToDoList
//
//  Created by Amel Dizdarevic on 7/22/22.
//

import SwiftUI

struct AddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var listViewModel: ListViewModel
    @State private var textFieldText = String()
    @State private var alertTitle: String = ""
    @State private var shouldShowAlert: Bool = false


    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)

                Button(action: {
                    saveButtonPressed()
                }) {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $shouldShowAlert, content: getAlert)
    }

    private func saveButtonPressed() {
        guard textIsAppropriate else { return }
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }

    private var textIsAppropriate: Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!!😩"
            shouldShowAlert.toggle()
            return false
        } else {
            return true
        }
    }

    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
