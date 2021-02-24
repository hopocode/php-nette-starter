import { path } from "path";
const vars = require("../init.config.json");
const replace = require("replace-in-file");
console.log("Setting project variables.");
console.log(vars);
const options = {
  files: [path.join(__dirname, "..")],
};

for (const varName in vars) {
  const optionsAction = { ...options };
  optionsAction.from = `__${varName}__`;
  optionsAction.to = vars[varName];
  replace.sync(optionsAction);
}
