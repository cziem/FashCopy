#!/bin/bash
Loop=3  # How many times to get input.
ParamsCount=1
message="Enter download link: "
type="Download Link: "
DownloadLink=""
filename=""
#Destination

getUserParams () {
  local local_var
  echo -n $message
  read local_var
  [ -n "$local_var" ] && eval $1=\$local_var
}


while [ "$ParamsCount" -le "$Loop" ]
do
  getUserParams var
  echo "$var"
if [ $ParamsCount -eq 1 ]
 then
  DownloadLink="$var";
  message="Enter Destination folder: "
  type="Destination"
else
if [ "$type" == "Destination" ]
  then 
   Destination="$var"
   message="Enter filename: "
   type="filename"
  else
   filename="$var"
  fi
fi
let "ParamsCount += 1"
  echo
done  
echo "Download Link: $DownloadLink; filename : $filename; Destination : $Destination"
echo
echo "Stating Download"
echo "Destination/$filename $DownloadLink"
if [ ! -d "~$Destination" ]; then
  mkdir ~$Destination
  echo ~$Destination
fi
if ! which curl >/dev/null; then
   sudo -k apt-get update
   sudo -k apt-get install curl -y
fi
    curl -o ~$Destination/$filename $DownloadLink 
    echo "Download Complete"
echo
exit 0