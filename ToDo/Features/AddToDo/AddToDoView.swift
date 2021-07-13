//
//  AddToDoView.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 12.07.21.
//

import SwiftUI

struct AddToDoView: View {
    @ObservedObject var viewModel: AddToDoViewModel
    @Binding var presentedAsModal: Bool
    @State private var todoName: String = ""
    @State private var todoDesc: String = ""
    @State private var showingToastFailed = false
    
    var body: some View {
        NavigationView {
            VStack() {
            Spacer()
                .frame(height: 50)
            VStack() {
                VStack(alignment: .leading) {
                    Text("Name:")
                    TextField("To-Do's Name", text: $todoName)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding(.bottom, 32)
                VStack(alignment: .leading) {
                    Text("Notes:")
                    TextField("Description", text: $todoDesc)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding(.bottom, 32)
                Button(action: {
                    if todoName.count == 0 {
                        showingToastFailed = true
                        return
                    }
                    viewModel.createToDo(title: todoName, description: todoDesc)
                    presentedAsModal = false
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                })
                .frame(minWidth: 0, maxWidth: 80, maxHeight: 10)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                .padding(.bottom, 40)
                Button(action: {
                    presentedAsModal = false
                }, label: {
                    Text("Dismiss")
                })
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 8)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
            Spacer()
            }
            .navigationBarTitle(Text("New To-Do"))
            .overlay(overlayView: ToastView.init(dataModel: ToastView.DataModel.init(title: "Todo's name is empty.", type: .error), show: $showingToastFailed), show: $showingToastFailed)
        }
    }
}
