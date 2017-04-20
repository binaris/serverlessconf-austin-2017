const stanza = `

const backtick = String.fromCharCode(96);
const quine = 'const stanza = '
      + backtick + stanza + backtick + ';'
      + stanza;
console.log(quine);`;

const backtick = String.fromCharCode(96);
const quine = 'const stanza = '
      + backtick + stanza + backtick + ';'
      + stanza;
console.log(quine);
