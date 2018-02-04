#!/bin/bash

source config.cfg

echo "old version ${VERSION_OLD}"
echo "new version ${VERSION_NEW}"
echo "source path ${SOURCE_PATH}"

git clone --branch=master ${GIT_PATH} ${SOURCE_PATH}

find ${SOURCE_PATH} -type f -name '*.ini' -o -name '*.xml' -o -name '*.sql' | xargs sed -i '' 's/'"${VERSION_OLD}"'/'"${VERSION_NEW}"'/g'

find ${SOURCE_PATH} -type f -name '*.ini' -o -name '*.xml' -o -name '*.sql' | xargs sed -i '' 's/'"${DATE_OLD}"'/'"${DATE_NEW}"'/g'

cd ${SOURCE_PATH} && git add . && git commit -m "${COMMIT_MESSAGE}" && git push origin master

source ${SCRIPTS_PATH}/createInstallationLanguages.sh