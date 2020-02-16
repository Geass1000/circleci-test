#!/bin/bash

packagesFolder=$1
whereSaveStatic=$2

if [ ! -d "${whereSaveStatic}" ]
then
  echo "Create ${whereSaveStatic} static folder"
  mkdir "${whereSaveStatic}"
fi

for folderPath in ${packagesFolder}/*; do
  folderName=$(basename $folderPath)
  if [[ (-d ${folderPath}) && (${folderName} =~  ^ng-.* ) ]]; then
    if [ ! -d "${folderPath}/dist" ]
    then
      echo "Static folder ${whereSaveStatic}/${folderName} doesn't contain build"
      continue
    fi

    if [ ! -d "${whereSaveStatic}/${folderName}" ]
    then
      echo "Create ${whereSaveStatic}/${folderName} static folder for package ${folderPath}"
      mkdir "${whereSaveStatic}/${folderName}"
    fi

    echo "Copy ${folderPath}/dist/ to ${whereSaveStatic}/${folderName}"
    cp -R ${folderPath}/dist/* ${whereSaveStatic}/${folderName}/
  fi
done