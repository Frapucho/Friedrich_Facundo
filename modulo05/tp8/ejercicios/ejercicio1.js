const fs = require('fs');
let rawdata = fs.readFileSync('d:/desktop/tarea/tp8/personas.json');
console.log(JSON.stringify(rawdata));

// JSON.stringify toma un objeto de JavaScript y lo transforma en una cadena JSON.

//JSON.parse toma una cadena JSON y la transforma en un objeto de JavaScript