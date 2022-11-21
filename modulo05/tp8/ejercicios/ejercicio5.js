

const fs = require("fs");
const rawdata = fs.readFileSync("D:/Desktop/tarea/tp8/departamentos.json", "utf8");
let departamentos = JSON.parse(rawdata);


function getDep(departamentos) {
  for (
    let i = 0;
    i < departamentos["departamentos"][1]["Tecnologia"].length; i++) {
    console.log(departamentos["departamentos"][1]["Tecnologia"][i]["nombre"] + " " + departamentos["departamentos"][1]["Tecnologia"][i]["puesto"]
    );
  }
}
getDep(departamentos);