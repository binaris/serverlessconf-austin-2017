'use strict';

exports.handler = (event, context, callback) => {
  const backtick = String.fromCharCode(96);
  const quine = `'use strict';

exports.handler = (event, context, callback) => {
  const backtick = String.fromCharCode(96);
  const quine = myself;
  const response = {
    "statusCode": 200,
    "headers": { },
    "body": quine.replace('myself', backtick + quine + backtick),
  };

  callback(null, response);
};`;
  const response = {
    "statusCode": 200,
    "headers": { },
    "body": quine.replace('myself', backtick + quine + backtick),
  };

  callback(null, response);
};
