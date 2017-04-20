const stanza = `

exports.handler = (event, context, cb) => {
  const backtick = String.fromCharCode(96);
  const quine = 'const stanza = '
    + backtick + stanza + backtick + ';'
    + stanza;
  const response = {
    statusCode: 200,
    body: quine,
  };
  cb(null, response);
};
`;

exports.handler = (event, context, cb) => {
  const backtick = String.fromCharCode(96);
  const quine = 'const stanza = '
    + backtick + stanza + backtick + ';'
    + stanza;
  const response = {
    statusCode: 200,
    body: quine,
  };
  cb(null, response);
};
