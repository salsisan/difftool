//
//  files.swift
//  difftool
//
//  Created by Yasser Elsayed on 10/1/17.
//  Copyright © 2017 Yasser Elsayed. All rights reserved.
//

import Foundation
import Cocoa

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
