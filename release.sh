#!/bin/bash

source config.cfg


echo -e "- Klone ${GIT_PATH} in ${SOURCE_PATH} ..."
git clone --branch=master ${GIT_PATH} ${SOURCE_PATH}

echo -e "- Ersetze Version  ${VERSION_OLD} mit ${VERSION_NEW} ... \c"
find ${SOURCE_PATH} -type f -name '*.ini' -o -name '*.xml' -o -name '*.sql' | xargs sed -i '' 's/'"${VERSION_OLD}"'/'"${VERSION_NEW}"'/g'

echo -e "- Ersetze Datum  ${DATE_OLD} mit ${DATE_NEW} ... \c"
find ${SOURCE_PATH} -type f -name '*.ini' -o -name '*.xml' -o -name '*.sql' | xargs sed -i '' 's/'"${DATE_OLD}"'/'"${DATE_NEW}"'/g'

echo -e "- Pushe alle Änderungen zurück mit der Message ${COMMIT_MESSAGE} \c"
cd ${SOURCE_PATH} && git add . && git commit -m "${COMMIT_MESSAGE}" && git push origin master

source ${SCRIPTS_PATH}/createInstallationLanguages.sh
source ${SCRIPTS_PATH}/createIt.run