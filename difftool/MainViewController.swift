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
    
    func browseFile() -> String? {
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["txt"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                return result?.path
            }
        }
        return nil
    }
    
    /**
     * Reads contents of given file
     */
    func readFile(path: String) -> String? {
        do {
            return try(NSString(contentsOfFile:path, encoding: String.Encoding.utf8.rawValue)) as String
        } catch let error as NSError{
            NSLog(error.localizedDescription)
        }
        return nil
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

