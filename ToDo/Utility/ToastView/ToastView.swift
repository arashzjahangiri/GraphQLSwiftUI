//
//  ToastView.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 12.07.21.
//

import SwiftUI

struct ToastView: View {
    
    struct DataModel {
        var title:String
        var type: ToastType
    }
    enum ToastType {
        case success
        case error
        
        var typeColor: Color {
            switch self {
            case .success:
                return .green
            case .error:
                return .red
            }
        }
        
        var typeImage: String {
            switch self {
            case .success:
                return "checkmark"
            case .error:
                return "xmark.octagon"
            }
        }
    }
    
    var dataModel: DataModel
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: dataModel.type.typeImage)
                Text(dataModel.title)
            }.font(.headline)
            .minimumScaleFactor(0.7)
            .foregroundColor(.primary)
            .padding([.top,.bottom],20)
            .padding([.leading,.trailing],40)
            .background(dataModel.type.typeColor)
            .clipShape(Capsule())
        }
        .padding(.bottom, 20)
        .padding([.leading,.trailing],40)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }
}

struct Overlay<T: View>: ViewModifier {
    
    @Binding var show: Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
}

extension View {
    func overlay<T: View>( overlayView: T, show: Binding<Bool>) -> some View {
        self.modifier(Overlay.init(show: show, overlayView: overlayView))
    }
}
