#!/bin/bash

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Name: Create Joomla!-Translation Release for J! 3.6                     #
#    Author: Jan Erik Zassenhaus (sisko1990@users.sourceforge.net)             #
# Copyright: Copyright (C) 2012 Jan Erik Zassenhaus. All rights reserved.      #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

function createDeDeTranslationPackages()
{
    local LANG_TAG="de-DE"

    _createTempStructure "${LANG_TAG}"
    _createFullTranslationPackage "${TRANSLATION_VERSION}" "${LANG_TAG}"
    echo ''
    _createFullInstallationPackage "${TRANSLATION_VERSION}" "${JOOMLA_URL}" "${LANG_TAG}"
}

function createDeChTranslationPackages()
{
    local LANG_TAG="de-CH"

    _createTempStructure "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/admin/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/site/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/full/${LANG_TAG}" "${LANG_TAG}"

    _renameStringInFilesByDir "${TMP_DIR}/admin/${LANG_TAG}" "ß" "ss"
    _renameStringInFilesByDir "${TMP_DIR}/site/${LANG_TAG}" "ß" "ss"
    _renameStringInFilesByDir "${TMP_DIR}/full/${LANG_TAG}" "ß" "ss"

    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Switzerland)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (CH)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<nativeName>Deutsch (Deutschland)<\/nativeName>" "<nativeName>Deutsch (Schweiz)<\/nativeName>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_CH.utf8, de_CH.UTF-8, de_CH, deu_CH, german-ch, ch, switzerland, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (CH)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_CHLocalise"

    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Switzerland)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (CH)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_CH.utf8, de_CH.UTF-8, de_CH, deu_CH, german-ch, ch, switzerland, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (CH)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_CHLocalise"

    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "<name>German (Germany) Language Pack<\/name>" "<name>German (Switzerland) Language Pack<\/name>"
    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

    _createFullTranslationPackage "${TRANSLATION_VERSION}" "${LANG_TAG}"
    echo ''
}

function createDeAtTranslationPackages()
{
    local LANG_TAG="de-AT"

    _createTempStructure "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/admin/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/site/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/full/${LANG_TAG}" "${LANG_TAG}"

    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Austria)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (AT)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<nativeName>Deutsch (Deutschland)<\/nativeName>" "<nativeName>Deutsch (Österreich)<\/nativeName>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_AT.utf8, de_AT.UTF-8, de_AT, deu_AT, german-at, at, austria, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (AT)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_ATLocalise"

    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Austria)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (AT)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_AT.utf8, de_AT.UTF-8, de_AT, deu_AT, german-at, at, austria, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (AT)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_ATLocalise"

    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "<name>German (Germany) Language Pack<\/name>" "<name>German (Austria) Language Pack<\/name>"
    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

    _createFullTranslationPackage "${TRANSLATION_VERSION}" "${LANG_TAG}"
    echo ''
}

function createDeLiTranslationPackages()
{
    local LANG_TAG="de-LI"

    _createTempStructure "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/admin/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/site/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/full/${LANG_TAG}" "${LANG_TAG}"

    _renameStringInFilesByDir "${TMP_DIR}/admin/${LANG_TAG}" "ß" "ss"
    _renameStringInFilesByDir "${TMP_DIR}/site/${LANG_TAG}" "ß" "ss"

    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Lichtenstein)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (LI)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<nativeName>Deutsch (Deutschland)<\/nativeName>" "<nativeName>Deutsch (Lichtenstein)<\/nativeName>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_LI.utf8, de_LI.UTF-8, de_LI, deu_LI, german-li, li, lichtenstein, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (LI)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_LILocalise"

    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Lichtenstein)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (LI)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_LI.utf8, de_LI.UTF-8, de_LI, deu_LI, li, german-li, li, lichtenstein, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (LI)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_LILocalise"

    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "<name>German (Germany) Language Pack<\/name>" "<name>German (Lichtenstein) Language Pack<\/name>"
    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

    _createFullTranslationPackage "${TRANSLATION_VERSION}" "${LANG_TAG}"
    echo ''
}

function createDeLuTranslationPackages()
{
    local LANG_TAG="de-LU"

    _createTempStructure "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/admin/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/site/${LANG_TAG}" "${LANG_TAG}"
    _renameFiles "${TMP_DIR}/full/${LANG_TAG}" "${LANG_TAG}"

    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Luxembourg)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (LU)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<nativeName>Deutsch (Deutschland)<\/nativeName>" "<nativeName>Deutsch (Luxemburg)<\/nativeName>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_LU.utf8, de_LU.UTF-8, de_LU, deu_LU, german-lu, lu, luxembourg, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (LU)<\/name>"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/admin/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_LULocalise"

    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<tag>de-DE<\/tag>" "<tag>${LANG_TAG}<\/tag>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (Germany)<\/name>" "<name>German (Luxembourg)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<name>German (DE)<\/name>" "<name>German (LU)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.xml" "<locale>de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>" "<locale>de_LU.utf8, de_LU.UTF-8, de_LU, deu_LU, german-lu, lu, luxembourg, de_DE.utf8, de_DE.UTF-8, de_DE, deu_DE, german, german-de, de, deu, germany<\/locale>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "<name>German (DE)<\/name>" "<name>German (LU)<\/name>"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/install.xml" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "de-DE" "${LANG_TAG}"
    _renameStringInFile "${TMP_DIR}/site/${LANG_TAG}/${LANG_TAG}.localise.php" "De_DELocalise" "De_LULocalise"

    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "<name>German (Germany) Language Pack<\/name>" "<name>German (Luxembourg) Language Pack<\/name>"
    _renameStringInFile "${TMP_DIR}/full/${LANG_TAG}/pkg_${LANG_TAG}.xml" "de-DE" "${LANG_TAG}"

    _createFullTranslationPackage "${TRANSLATION_VERSION}" "${LANG_TAG}"
    echo ''
}

function _createFrontendTranslationPackage()
{
    ## Parameter:
    # $1 = Language Tag

    echo -e "- Erstelle Site-Sprachpaket (${1}) - Zip ... \c"
    pushd "${TMP_DIR}/site/${1}" > '/dev/null'
    zip -r "${TMP_DIR}/full/${1}/site_${1}.zip" . > '/dev/null'
    popd > '/dev/null'
    echo 'OK!'
}

function _createBackendTranslationPackage()
{
    ## Parameter:
    # $1 = Language Tag

    echo -e "- Erstelle Admin-Sprachpaket (${1}) - Zip ... \c"
    pushd "${TMP_DIR}/admin/${1}" > '/dev/null'
    zip -qr "${TMP_DIR}/full/${1}/admin_${1}.zip" . > '/dev/null'
    popd > '/dev/null'
    echo 'OK!'
}

function _createFullTranslationPackage()
{
    ## Parameter:
    # $1 = Version number
    # $2 = Language Tag

    if [[ -z "${1}" ]]; then
        if [[ ! -z "${TRANSLATION_VERSION}" ]]; then
            local VERSION="${TRANSLATION_VERSION}"
        else
            echo 'Creating of Full-Package without version number aborted!'
            exit 1
        fi
    else
        local VERSION="${1}"
    fi

    _createFrontendTranslationPackage "${2}"
    _createBackendTranslationPackage "${2}"

    echo -e "- Erstelle Full-Sprachpaket (${2}) - Zip ... \c"
    pushd "${TMP_DIR}/full/${2}" > '/dev/null'
    zip -qr "${EXPORT_DIR}/${2}_joomla_lang_full_${VERSION}.zip" . > '/dev/null'
    popd > '/dev/null'
    echo 'OK!'
}

function _createFullInstallationPackage()
{
    ## Parameter:
    # $1 = Version number
    # $2 = Joomla!-URL (installation package)
    # $3 = Language Tag

    if [[ -z "${1}" || -z "${2}" || -z "${3}" ]]; then
        echo 'createFullInstallationPackage: None of the three parameters can be empty!'
        exit 1
    fi
    local JVERSION=$(echo "${1}" | cut -d 'v' -f1)

    _downloadFromUrlAndUnpackTar "${2}" "${TMP_DIR}/fullInstall/${3}"

    cp -r "${GIT_DIR}/administrator" "${TMP_DIR}/fullInstall/${3}"
    cp -r "${GIT_DIR}/language" "${TMP_DIR}/fullInstall/${3}"
    cp -r "${GIT_DIR}/installation" "${TMP_DIR}/fullInstall/${3}"
    cp -r "${GIT_DIR}/media" "${TMP_DIR}/fullInstall/${3}"
    cp "${GIT_DIR}/pkg_de-DE.xml" "${TMP_DIR}/fullInstall/${3}/administrator/manifests/packages/"

    _createAndMoveArchives "- Erstelle deutsches Full Installation Package (de-DE) - Zip, Tar.gz und Tar.bz2 ... " "${TMP_DIR}/fullInstall/${3}" "${EXPORT_DIR}/Joomla_${JVERSION}-Stable-Full_Package_German"
}
