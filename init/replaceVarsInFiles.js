const path = require("path");
const replace = require("replace-in-file");

module.exports = replaceVarsInFiles = (vars) => {
  const options = {
    files: [path.join(__dirname, "../**/*")],
  };
  for (const varName in vars) {
    const optionsAction = { ...options };
    optionsAction.from = `__${varName}__`;
    optionsAction.to = vars[varName];
    replace.sync(optionsAction);
  }
};
