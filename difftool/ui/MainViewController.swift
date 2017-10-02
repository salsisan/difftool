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
      colorTextAreas()
      let h = HelloWorldWrapper()
      h.say_hello()
    }
  }
  
  override func viewDidAppear() {
    // Set window size to 80%
    let screenSize = NSScreen.main!.frame
    let percent = CGFloat(0.80)
    let offset: CGFloat = CGFloat((1.0 - percent) / 2.0)
    NSApplication.shared.mainWindow!.setFrame(NSMakeRect(
      screenSize.size.width * offset,
      screenSize.size.height * offset,
      screenSize.size.width * percent,
      screenSize.size.height * percent),
                                              display: true)
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
    leftTextArea.scroll(NSPoint.zero)
    rightTextArea.insertText(rightContents!, replacementRange: emptyRange)
    rightTextArea.scroll(NSPoint.zero)
  }
  
  func colorTextAreas() {
    leftTextArea.backgroundColor = NSColor.green;
  }
}

