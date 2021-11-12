const readline = require("readline");
const replaceVarsInFiles = require("./replaceVarsInFiles");
const installFolder = process.argv[1];
console.log(installFolder);

const cl = readline.createInterface(process.stdin, process.stdout);
const question = (q) => {
  return new Promise((res, rej) => {
    cl.question(q + ": ", (answer) => res(answer));
  });
};

const runScript = async () => {
  const data = {
    PROJECT_NAME: await question("Project name"),
    PROJECT_DESCRIPTION: await question("Project description"),
    DEV_PORT: await question("Dev PORT number"),
    DBNAME: await question("Database name"),
    DBUSER: await question("Database user"),
    DBPASSWORD: await question("Database password"),
  };
  const sftpProd = await question("Setup SFTP production connection? [Y/N]");
  if (sftpProd.toUpperCase() === "Y") {
    data.SFTP_PROD_HOST = await question("SFTP production host");
    data.SFTP_PROD_USER = await question("SFTP production user");
    data.SFTP_PROD_PASSWORD = await question("SFTP production password");
    data.SFTP_PROD_PORT = await question("SFTP production password");
  }
  const sftpDev = await question("Setup SFTP dev connection? [Y/N]");
  if (sftpDev.toUpperCase() === "Y") {
    data.SFTP_DEV_HOST = await question("SFTP dev host");
    data.SFTP_DEV_USER = await question("SFTP dev user");
    data.SFTP_DEV_PASSWORD = await question("SFTP dev password");
    data.SFTP_PROD_PORT = await question("SFTP dev port");
  }
  // Lets replace vars to config file
  replaceVarsInFiles(data);
};
runScript().then((r) => {
  console.log("Instalation done.");
  process.exit();
});
