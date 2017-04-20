'use strict';

const AdmZip = require('adm-zip');

exports.handler = (event, context, callback) => {
  // creating archives 
  const zip = new AdmZip();

  // add file directly 
  for (const key in event){
    if (event.hasOwnProperty(key)) {
      zip.addFile(key, new Buffer(event[key]), 'comment', parseInt('0777',8) << 16);
    }
  }

  // get everything as a buffer 
  callback(null, zip.toBuffer());
};
