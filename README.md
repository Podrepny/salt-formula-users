# salt-formula-users
Develop salt formula for user control users on controlled host machines

Usage
=======
configure user account definitions from configuration the pillar/users/ubuntu.sls or centos.sls:
```
user-name-to-be-added:
    fullname: Canonical
    uid: 1022
    gid: 1022
    home: /home/canonical
    groups:
      - tty
      - users
    priv_keys:
      key1: centos.pem
      key2: centos1.pem
    sudousr: True

del_users:
  redhat:
    absent: True
    purge: True
    force: True
```

Example
=======
```
  canonical:
    fullname: Canonical
    uid: 1022
    gid: 1022
    home: /home/canonical
    groups:
      - tty
      - users
    priv_keys:
      key1: centos.pem
      key2: centos1.pem
    sudousr: True

del_users:
  redhat:
    absent: True
    purge: True
    force: True
```
