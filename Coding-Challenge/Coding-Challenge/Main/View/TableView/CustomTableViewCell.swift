//
//  CustomTableViewCell.swift
//  Coding-Challenge
//
//  Created by Paolo Ramos Mendez on 4/20/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cellView: UIView!
    var isSwipeToLeft = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCellView(cellFrame: CGRect) {
        self.frame = cellFrame
        self.contentView.frame = cellFrame
        
        let leftView = LeftView(frame: CGRect(x: 0.0, y: 0.0, width: self.scrollView.frame.width, height: 64.0))
        let view = CentralView(frame: CGRect(x: self.scrollView.frame.width, y: 0.0, width: self.scrollView.frame.width, height: 64.0))
        let rightView = RightView(frame: CGRect(x: self.scrollView.frame.width * 2, y: 0.0, width: self.scrollView.frame.width, height: 64.0))
        
        leftView.backgroundColor = .red
        view.backgroundColor = .yellow
        rightView.backgroundColor = .green
        
        self.scrollView.addSubview(leftView)
        self.scrollView.addSubview(view)
        self.scrollView.addSubview(rightView)
        
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width * 3.0, height: 64.0)
        
        self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: false)
        
        self.scrollView.isScrollEnabled = false
        
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action:
                                                        #selector(swipeMade(_:)))
        leftRecognizer.direction = .left
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action:
                                                        #selector(swipeMade(_:)))
        rightRecognizer.direction = .right
        
        self.cellView.addGestureRecognizer(leftRecognizer)
        self.cellView.addGestureRecognizer(rightRecognizer)
        
    }
    
    func setInitialScroll() {
        self.isSwipeToLeft = 1
        self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
    }
    
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        
        if self.isSwipeToLeft != 1 {
            self.isSwipeToLeft = 1
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
            return
        }

        if sender.direction == .right {
            self.isSwipeToLeft = 0
            if scrollView.contentOffset.x < scrollView.frame.size.width {
                self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
            }
            else {
                self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width/2.0, y: 0.0), animated: true)
            }
        }
        
        if sender.direction == .left {
            self.isSwipeToLeft = 2
            if scrollView.contentOffset.x < scrollView.frame.size.width {
                self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
            }
            else {
                self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width+(self.scrollView.frame.width/2.0), y: 0.0), animated: true)
            }
        }
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        self.initialAction()
        self.rightAction()
    }
    
    @IBAction func leftAction(_ sender: UIButton) {
        self.initialAction()
        self.leftAction()
        
    }
    
    func initialAction() {
        if self.isSwipeToLeft != 1 {
            self.isSwipeToLeft = 1
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
            return
        }
    }
    
    func rightAction() {
        self.isSwipeToLeft = 2
        if scrollView.contentOffset.x < scrollView.frame.size.width {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
        }
        else {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width+(self.scrollView.frame.width/2.0), y: 0.0), animated: true)
        }
    }
    
    func leftAction() {
        self.isSwipeToLeft = 0
        if scrollView.contentOffset.x < scrollView.frame.size.width {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0.0), animated: true)
        }
        else {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width/2.0, y: 0.0), animated: true)
        }
    }
    
}
