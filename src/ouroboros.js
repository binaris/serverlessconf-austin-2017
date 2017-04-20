const js = `
const quote = String.fromCharCode(34);
const newline = String.fromCharCode(10);
const marker = quote + quote + quote;
const quine = 'js = ' + marker + js + marker + newline + 'py = ' + marker + py + marker + py;
console.log(quine);`;
const py = `
backtick = chr(96)
newline = chr(10)
quine = 'const js = ' + backtick + js + backtick + ';' + newline + 'const py = ' + backtick + py + backtick + ';' + js
print(quine)`;
const quote = String.fromCharCode(34);
const newline = String.fromCharCode(10);
const marker = quote + quote + quote;
const quine = 'js = ' + marker + js + marker + newline + 'py = ' + marker + py + marker + py;
console.log(quine);
