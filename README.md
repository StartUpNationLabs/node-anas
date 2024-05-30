# Automating updates

To add automatic update of the confirguration contained in this repository, you can add the following to your crontab (run `crontab -e` to edit your crontab):

```crontab
# Update configuration
* * * * * bash /path/to/this/repository/.scripts/fetch-and-update.sh
```