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
  @IBOutlet var pathControl: NSPathControl!
  
  @IBAction func didClickWorkspacePathControl(_ sender: NSPathControl) {
    if let clickedCell = sender.clickedPathComponentCell() {
      do {
        // Get the directory contents urls (including subfolders urls)
        let path = (clickedCell.url!.absoluteString as NSString).deletingLastPathComponent
        let directoryContents = try FileManager.default.contentsOfDirectory(at: NSURL(string: path) as! URL, includingPropertiesForKeys:nil, options: [])
        print(directoryContents)
      } catch {
        print(error.localizedDescription)
      }
    } else {
      NSLog("No path component was selected.")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Initialize text areas
    initTextArea(view: leftTextArea)
    initTextArea(view: rightTextArea)

    if let left = Bundle.main.path(forResource: "samples/left", ofType: "txt"),
      let right = Bundle.main.path(forResource: "samples/right", ofType: "txt") {
      
      fillTextAreas(leftFile: left, rightFile: right)
      let d = DiffMatchPatch()
      let result = d.diff_main(ofOldString: "hello", andNewString: "helo")
      print(result!)
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

  func initTextArea(view: NSTextView) {
    view.font = NSFont(name: "Menlo-Regular", size: 11.0)!
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
  
}

