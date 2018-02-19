import * as electron from 'electron';
import { remote } from 'electron';
const app = remote.app;
const BrowserWindow = remote.BrowserWindow;
const dialog = remote.dialog;
import * as CodeMirror from 'codemirror';
import * as Split from 'split.js';
import * as fs from 'fs';

Split(['.left.pane', '.right.pane']);

const leftEditor = CodeMirror.fromTextArea(document.querySelector('.left.editor'), {
  lineNumbers: true,
  lineWrapping: true,
  mode: 'javascript',
  theme: 'mbo',
});

leftEditor.value = 'hello world';
const rightEditor = CodeMirror.fromTextArea(document.querySelector('.right.editor'), {
  lineNumbers: true,
  lineWrapping: true,
  mode: 'javascript',
  theme: 'mbo',
});

rightEditor.value = 'hello world';

function browse(pane) {
  dialog.showOpenDialog(null, (fileNames) => {
    if (fileNames === undefined) {
      return;
    }
    const fileName = fileNames[0];
    fs.readFile(fileName, 'utf-8', (err, data) => {
      if (pane === 'left') {
        leftEditor.setValue(data);
      }
      else {
        rightEditor.setValue(data);
      }
    });
  });
}

document.querySelector('#leftBrowse').addEventListener('click', () => browse('left'));
document.querySelector('#rightBrowse').addEventListener('click', () => browse('right'));
