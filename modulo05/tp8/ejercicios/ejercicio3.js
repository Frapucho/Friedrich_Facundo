
const fs = require('fs');
fs.readFile('D:/Desktop/tarea/tp8/personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.stringify(data));
});


//JSON.stringify devuelve una cadena de valores 

console.log(data);

