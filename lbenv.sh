#!/bin/bash


### Cert ###
#Edit path to your cert file
export cert="/path/lb-my-cert.pem"



###Host###
declare -A hostarray

#Dev
hostarray[devdata]=https://dev.localhost
hostarray[devmetadata]=https://metadev.localhost

#QA
hostarray[qadata]=https://qadata.localhost
hostarray[qametadata]=https://qametadata.localhost


#QA
hostarray[stagedata]=https://stagedata.localhost
hostarray[stagemetadata]=https://stagemetadata.localhost

#Prod

hostarray[proddata]=https://proddata.localhost/
hostarray[prodmetadata]=https://prodmetadata.localhost/


export hostarray



#query path
querypath[find]=/test/data/find/
querypath[insert]=/test/data/insert/
querypath[update]=/test/data/update/
querypath[delete]=/test/data/delete/
querypath[meta]=/test/metadata/

export querypath
