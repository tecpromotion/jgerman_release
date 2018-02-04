#!/bin/bash

# Author: Jan Erik Zassenhaus


WORK_PATH="${SOURCE_PATH}/installation/language"

function _renameStringInFile()
{
    ## Parameters:
    # $1 = The absolute path to the file
    # $2 = Search string
    # $3 = Replace string

    sed -i '' 's/'"${2}"'/'"${3}"'/g' "${1}"
}

function _createInstallLangFiles()
{
    ## Parameters:
    # $1 = Language Tag

    test -d "${WORK_PATH}/${1}" || mkdir -p "${WORK_PATH}/${1}"
    cp -a "${WORK_PATH}/de-DE/de-DE.xml" "${WORK_PATH}/${1}/${1}.xml"
    cp -a "${WORK_PATH}/de-DE/de-DE.ini" "${WORK_PATH}/${1}/${1}.ini"
}



LANG_TAG="de-CH"
_createInstallLangFiles "${LANG_TAG}"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Germany" "Switzerland"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Deutschland" "Schweiz"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "Deutschland" "Schweiz"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "ß" "ss"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

LANG_TAG="de-AT"
_createInstallLangFiles "${LANG_TAG}"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Germany" "Austria"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Deutschland" "Österreich"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "Deutschland" "Österreich"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

LANG_TAG="de-LI"
_createInstallLangFiles "${LANG_TAG}"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Germany" "Lichtenstein"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Deutschland" "Lichtenstein"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "Deutschland" "Lichtenstein"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "ß" "ss"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

LANG_TAG="de-LU"
_createInstallLangFiles "${LANG_TAG}"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Germany" "Luxembourg"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "Deutschland" "Luxemburg"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.ini" "Deutschland" "Luxemburg"
_renameStringInFile "${WORK_PATH}/${LANG_TAG}/${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"
