//
//  GlobalFunctions.swift
//  Silverwolf
//
//  Created by Mac on 01/04/22.
//

import Foundation
import SwiftMessages
//import SDWebImage

// To perform an action after a delay.
func delay(_ seconds: Double, f: @escaping () -> Void) {
    let delay = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delay) {
        f()
    }
}

// MARK: - Top bar
func showWorkInProgress() {
    showMessage(with: "Work in progress", theme: .warning)
}

func showMessage(with title: String, theme: Theme = .error) {
    SwiftMessages.show {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureContent(title: title , body: title, iconImage: Icon.info.image)
       // view.backgroundColor = UIColor.green
        view.button?.isHidden = true
//        view.bodyLabel?.font = UIFont.appRegularFont(with: 15)
        view.titleLabel?.isHidden = true
        view.iconLabel?.isHidden = true
        return view
    }
}
