const AdmZip = require('adm-zip');

exports.handler = (event, context, callback) => {
  // creating archives
  const zip = new AdmZip();

  // add files directly
  Object.keys(event).forEach((key) => {
    zip.addFile(key, new Buffer(event[key]), 'no comment', 0o777 << 16);
  });

  // return the zip as a buffer
  callback(null, zip.toBuffer());
};
