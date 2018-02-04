#!/bin/bash

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Name: Create Joomla!-Translation Release for J! 3.6                     #
#    Author: Jan Erik Zassenhaus (sisko1990@users.sourceforge.net)             #
# Copyright: Copyright (C) 2012 Jan Erik Zassenhaus. All rights reserved.      #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

function checkDirExistsOrCreateIt()
{
    ## Parameter:
    # $1 = The absolute path to check for dir

    # Check if the variable is empty
    if [[ -z "${1}" ]]; then
        echo 'The path for "checkDirExistsOrCreateIt" is empty!'
        exit 1
    fi

    # Test if the dir is already created
    if [[ ! -d "${1}" ]]; then
        mkdir -p "${1}"
    else
        rm -rf "${1}"
        mkdir -p "${1}"
    fi
}

function loadGit()
{
    ## Parameters:
    # $1 = URL
    # $2 = Tag name

    echo -e "- Lade GIT-Tag herunter... \c"
    pushd "${GIT_DIR}"  > '/dev/null'
    git clone "${1}" .
    git checkout "${2}"
    popd > '/dev/null'
    echo 'OK!'

    echo -e "- Lösche .git-Dateien... \c"
    find "${GIT_DIR}" -type d -name '.git' | xargs rm -rf
    rm -f "${GIT_DIR}/.gitattributes" "${GIT_DIR}/README.md"
    echo -e "OK!\n"
}

function _createTempStructure()
{
    ## Parameters:
    # $1 = Language Tag

    # Check if the variable is empty
    if [[ -z "${1}" ]]; then
        echo 'The Language Tag for "createTempStructure" is empty!'
        exit 1
    fi

    echo -e "- Erstelle Struktur (${1}) ... \c"
    checkDirExistsOrCreateIt "${TMP_DIR}/admin/${1}"
    checkDirExistsOrCreateIt "${TMP_DIR}/site/${1}"
    checkDirExistsOrCreateIt "${TMP_DIR}/full/${1}"
    if [[ "${1}" == "de-DE" ]]; then
        checkDirExistsOrCreateIt "${TMP_DIR}/fullInstall/${1}"
    fi
    echo 'OK!'

    echo -e "- Sortiere Dateien (${1}) ... \c"
    cp -r "${GIT_DIR}/administrator/language/de-DE/"* "${TMP_DIR}/admin/${1}"
    cp -r "${GIT_DIR}/language/de-DE/"* "${TMP_DIR}/site/${1}"
    cp -r "${GIT_DIR}/pkg_de-DE.xml" "${TMP_DIR}/full/${1}"
    echo -e "OK!\n"
}

function _renameFiles()
{
    ## Parameters:
    # $1 = The absolute path to rename in
    # $2 = Replace string

    pushd "${1}"  > '/dev/null'
    for OLD_FILENAME in *
    do
        local NEW_FILENAME=$(echo "${OLD_FILENAME}" | sed -e 's/de-DE/'"${2}"'/g')
        if [[ "${OLD_FILENAME}" != "${NEW_FILENAME}" ]]; then
            mv "${OLD_FILENAME}" "${NEW_FILENAME}"
        fi
    done
    popd > '/dev/null'
}

function _renameStringInFile()
{
    ## Parameters:
    # $1 = The absolute path to the file
    # $2 = Search string
    # $3 = Replace string

    sed -i '' 's/'"${2}"'/'"${3}"'/g' "${1}"
}

function _renameStringInFilesByDir()
{
    ## Parameters:
    # $1 = The absolute path to the file
    # $2 = Search string
    # $3 = Replace string

    find "${1}" -type f -exec sed -i '' ''s/'"${2}"'/'"${3}"'/g' {} \;
}

function _downloadFromUrlAndUnpackTar()
{
    ## Parameter:
    # $1 = URL to load the Tar archive from
    # $2 = The absolute path to extract the archive in (without an ending slash)

    if [[ -z "${1}" || -z "${2}" ]]; then
        echo '_downloadFromUrlAndUnpackTar: None of the two parameters can be empty!'
        exit 1
    fi
    local FILENAME=$(basename "${1}")

    echo -e "- Lade das Paket \"${FILENAME}\" herunter... \c"
    wget -q "${1}" -O "${2}/${FILENAME}"
    echo 'OK!'

    echo -e "- Entpacke das Archiv... \c"
    tar -xf "${2}/${FILENAME}" -C "${2}/"
    echo 'OK!'

    echo -e "- Lösche das heruntergeladene Archiv... \c"
    rm "${2}/${FILENAME}"
    echo -e "OK!\n"
}

function _createAndMoveArchives()
{
    ## Parameter:
    # $1 = Text to show
    # $2 = Absolute path to create archives from (without an ending slash)
    # $3 = Absolute path to move archive + filename without file endings
    if [[ -z "${1}" || -z "${2}" || -z "${3}" ]]; then
        echo '_createAndMoveArchives: None of the three parameters can be empty!'
        exit 1
    fi

    echo -e "${1}\c"
    pushd "${2}" > '/dev/null'
    zip -qr "${3}.zip" . > '/dev/null'
    tar --group 0 --owner 0 -czf "${3}.tar.gz" -C "${2}" * > '/dev/null'
    tar --group 0 --owner 0 -cjf "${3}.tar.bz2" -C "${2}" * > '/dev/null'
    popd  > '/dev/null'
    echo 'OK!'
}

function syncToSourceForge()
{
    mkdir "${EXPORT_DIR}/German Full Packages" "${EXPORT_DIR}/Joomla! Installer Packages"
    mv "${EXPORT_DIR}/Joomla_"* "${EXPORT_DIR}/German Full Packages"
    mv "${EXPORT_DIR}/"*"_joomla_lang"* "${EXPORT_DIR}/Joomla! Installer Packages"

    MAIN_VERSION=$(echo "${TRANSLATION_VERSION}" | cut -d "." -f1,2)

    rsync -avhz --progress -e ssh "${EXPORT_DIR}/" USERNAME@frs.sourceforge.net:"/home/frs/project/PROJECTNAME/Translations/Core/Joomla\!\ "${MAIN_VERSION}"/Joomla\!\ "${TRANSLATION_VERSION}"/"
}