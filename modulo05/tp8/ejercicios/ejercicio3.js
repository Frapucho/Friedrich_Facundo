'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
});


//JSON.stringify

console.log(data);

//