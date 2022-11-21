


const fs = require("fs");
const rawdata = fs.readFileSync("D:/Desktop/tarea/tp8/personas.json", "utf8");
var persona = JSON.parse(rawdata);

getNombre(persona);

function getNombre(listadepersonas) {
  for (var i = 0; i < listadepersonas["personas"].length; i++) {
    if (listadepersonas["personas"][i]["Localidad"] === "Posadas") {
      console.log(
        listadepersonas["personas"][i]["Nombre"] +
          " " +
          listadepersonas["personas"][i]["Apellido"]
      );
    }
  }
} 
 