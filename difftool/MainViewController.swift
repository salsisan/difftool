//
//  MainViewController.swift
//  difftool
//
//  Created by Yasser Elsayed on 9/23/17.
//  Copyright © 2017 Yasser Elsayed. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        do {
            let contents = try(NSString(contentsOfFile: "samples/right.txt", encoding: String.Encoding.utf8.rawValue))
            print(contents)
        } catch let error as NSError {
            print(error.localizedDescription)
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

}
