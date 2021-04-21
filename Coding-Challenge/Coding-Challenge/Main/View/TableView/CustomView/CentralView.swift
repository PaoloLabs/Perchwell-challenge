//
//  CentralView.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//

import UIKit

class CentralView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    // For using  CustomView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    // For using CustomView in IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubView()
    }
    
    // Settings
    private func initSubView() {
        self.initXibSubView()
        self.addConstraints(contentView: self.contentView)
    }
}
