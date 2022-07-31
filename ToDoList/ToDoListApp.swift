//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Amel Dizdarevic on 7/22/22.
//

import SwiftUI

@main
struct ToDoListApp: App {

    @StateObject var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel )
        }

    }
}
