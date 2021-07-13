//
//  ContentView.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 10.07.21.
//

import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoViewModel
    @State private var showingToastSuccess = false
    @State private var showingToastFailed = false
    @State var presentingModally = false
    
    var body: some View {
        NavigationView {
            List(viewModel.toDoList) { item in
                ToDoRow(model: item).onLongPressGesture {
                    if let idOfItem = item.id {
                        viewModel.updateItem(id: idOfItem)
                        showingToastSuccess = true
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.presentingModally = true
                    }, label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New ToDo")
                        }
                    }).sheet(isPresented: $presentingModally) {
                        viewModel.getToDoList()
                    } content: {
                        AddToDoView(viewModel: AddToDoViewModel(), presentedAsModal: $presentingModally)
                    }

                }
            }
            .overlay(overlayView: ToastView.init(dataModel: ToastView.DataModel.init(title: "Updating was successful", type: .success), show: $showingToastSuccess), show: $showingToastSuccess)
            .overlay(overlayView: ToastView.init(dataModel: ToastView.DataModel.init(title: "Updating was failed", type: .error), show: $showingToastFailed), show: $showingToastFailed)
            .navigationBarTitle("To-Do list", displayMode: .large)
            .onAppear() {
                viewModel.getToDoList()
            }
        }
    }
}
