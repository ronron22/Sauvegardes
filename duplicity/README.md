
# duplicityme.sh

This script make a full backup one day by month and incremental backup all other days

* duplicity : shell script for backuping
* duplicity-cron : daily cron task

###  see backuping files

```bash
duplicity  list-current-file  --encrypt-key C56DA --sign-key C56DA    ssh://16.17.16.38//sauvegardes/n7
```
