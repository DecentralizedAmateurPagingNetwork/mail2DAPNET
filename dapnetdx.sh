#!/bin/bash
subject=`echo $1 | cut -d" " -f2`"z "`echo $1 | cut -d" " -f4-`;
band=`echo $1 | cut -d" " -f4`;
# $user und $passwort müssen gültige DAPNET-Credentials mit entsprechenden Rechten sein
user=mickimaus
passwort=gustavgans

case $band in
50)
  band=2
  ;;
70)
  band=3
;;
144)
  band=4
  ;;
*)
  band=5
  ;;
esac
curl -s -H "Content-Type: application/json" -X POST -u $user:$passwort -d '{ "text": "'"$subject"'", "callSignNames": ["dg5mm","dl5fmk"], "transmitterGroupNames": ["all"], "emergency": false }' hampager.de:8080/calls >/dev/null
sleep 1
curl -s -H "Content-Type: application/json" -X POST -u $user:$passwort -d '{ "text": "'"$subject"'", "rubricName": "dxcond", "number": "'"$band"'" }' hampager.de:8080/news >/dev/null
