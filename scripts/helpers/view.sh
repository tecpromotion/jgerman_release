#!/bin/bash

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#      Name: Create Joomla!-Translation Release for J! 1.5 and 2.5             #
#    Author: Jan Erik Zassenhaus (sisko1990@users.sourceforge.net)             #
# Copyright: Copyright (C) 2012 Jan Erik Zassenhaus. All rights reserved.      #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

function startScreen()
{
	clear
	echo 'Hi ;-)'
	echo 'Lass uns ein neues Release erstellen...'
	echo -e "Vorher brauche ich aber noch ein paar Daten von Dir...\n"
	echo '########################################################################################'
	echo '### Welchen Übersetzungs-GIT-Tag soll ich nehmen (z.B. „3.6.0v1“)?: '
	read TRANSLATION_VERSION
	echo '### Wo finde ich das original Installationspaket von Joomla! (URL + Tar.gz)?: '
	read JOOMLA_URL
	echo '########################################################################################'
	echo 'Danke! Ich kann jetzt arbeiten...'
	echo '########################################################################################'
}
