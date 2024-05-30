## First time deployment

If your server does not have a gpg key, you have to generate one. You can do so by running the following command:

```bash
gpg --gen-key
```

Then import the key to your local gpg keychain by running the following command:

On the server:
```bash
gpg --export-secret-keys --armor <email-of-the-server> > <path-to-the-key>
```

Then copy the key to your local machine and import it by running the following command:
```bash
gpg --import <path-to-the-key>
```

Then enroll the key to the git-secret tool by running the following command:
```bash
git secret tell <email-of-the-server>
git secret reveal
git secret hide -d
```

Finally, commit and push the changes to the repository.

## Automating updates

To add automatic update of the confirguration contained in this repository, you can add the following to your crontab (run `crontab -e` to edit your crontab):

```crontab
# Update configuration
* * * * * bash /path/to/this/repository/.scripts/fetch-and-update.sh
```

## Secrets Management

### git-secret
This repository contains encrypted secrets thanks to [git-secret](https://sobolevn.me/git-secret/)([GitHub](https://github.com/sobolevn/git-secret)).

To decrypt the secrets, you need to have the `git-secret` tool installed. You can install by following the instructions [here](https://sobolevn.me/git-secret/installation#installation-process).

After installing `git-secret`, you can decrypt the secrets by running `git secret reveal` (note that you need to be authorized to decrypt the secrets).