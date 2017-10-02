//
//  MainViewController.swift
//  difftool
//
//  Created by Yasser Elsayed on 9/23/17.
//  Copyright © 2017 Yasser Elsayed. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    @IBOutlet var leftTextArea: NSTextView!
    @IBOutlet var rightTextArea: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let left = Bundle.main.path(forResource: "samples/left", ofType: "txt"),
            let right = Bundle.main.path(forResource: "samples/right", ofType: "txt") {
            
            fillTextAreas(leftFile: left, rightFile: right)
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func openFilesFromPicker() {
        let left = browseFile()
        if (left == nil) {
            return
        }
        let right = browseFile()
        if (right == nil) {
            return
        }
        fillTextAreas(leftFile: left!, rightFile: right!)
    }
    
    func fillTextAreas(leftFile: String, rightFile: String) {
        let leftContents = readFile(path: leftFile)
        let rightContents = readFile(path: rightFile)

        let emptyRange = NSRange(location: NSNotFound, length: 0)
        leftTextArea.insertText(leftContents!, replacementRange: emptyRange)
        rightTextArea.insertText(rightContents!, replacementRange: emptyRange)
    }
    
}

