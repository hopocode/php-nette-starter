#!/usr/bin/env bash
echo "Please fill dir to install new nette project."
read install_folder
cp -R * $install_folder
rm $install_folder/readme.md
mv $install_folder/_readme.md $install_folder/readme.md
rm $install_folder/install.sh
echo "**********************************************"
echo "              Nette web createor              "
echo "**********************************************"
echo "**********************************************"
cd $install_folder/init
npm i
node setup.js $install_folder
rm -Rf init
echo "You show now init application by run: npm init"
echo "Than run applicaton by run: npm start"