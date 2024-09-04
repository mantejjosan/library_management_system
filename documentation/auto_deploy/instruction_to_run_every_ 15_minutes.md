## Update app on production server

Makescript executable. In following example script `update_and_migrate.sh` is in the home folder of user `frappe`.

```sh
chmod +x /home/frappe/update_and_migrate.sh
```
Issue following command to make entry in cron table:

```sh
crontab -e
```
Type following content:

```sh
*/15 * * * * /home/frappe/update_and_migrate.sh
```

The script will create los at: `/home/frappe/updateLMS.log`.
