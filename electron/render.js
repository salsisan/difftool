const fs = require('fs');
const CodeMirror = require('codemirror');
const {
  dialog
} = require('electron').remote;

const Split = require('split.js')
Split(['.left.pane', '.right.pane']);

const leftEditor = CodeMirror.fromTextArea(document.querySelector('.left.editor'), {
  lineNumbers: true,
  lineWrapping: true,
  theme: 'mbo',
  mode: 'javascript',
});
leftEditor.value = 'hello world';

const rightEditor = CodeMirror.fromTextArea(document.querySelector('.right.editor'), {
  lineNumbers: true,
  lineWrapping: true,
  theme: 'mbo',
  mode: 'javascript',
});
rightEditor.value = 'hello world';

function browse(pane) {
  dialog.showOpenDialog(function (fileNames) {
    if (fileNames === undefined) {
      return;
    }
    const fileName = fileNames[0];
    fs.readFile(fileName, 'utf-8', function (err, data) {
      if (pane === 'left') {
        leftEditor.setValue(data);
      } else {
        rightEditor.setValue(data);
      }
    });
  });
}