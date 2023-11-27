//
//  MyTextField.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/27.
//

import SwiftUI

//SwiftUI에서 온 값을 UIKit으로 잘 전달은 됐다
//UIKit의 값을 SwiftUI로 다시 보내주어야 한다
struct MyTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.borderStyle = .none
        view.keyboardType = .numberPad
        view.tintColor = .red
        view.font = .boldSystemFont(ofSize: 20)
        view.textAlignment = .center
        view.placeholder = "UIKit 텍스트필드입니다"
        view.text = text
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    //UIKit이 가지고 있는 수많은 delegate에서의 타이밍을 SwiftUI로 전달해주기 위함
    //UIKit -> SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            text = textField.text ?? ""
            
            return true
        }
        
    }
}
