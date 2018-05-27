# Salt-formula-users
Develop salt formula for user control users on controlled host machines

Usage
=======
configure user account definitions from configuration the pillar/users/ubuntu.sls or centos.sls:
<<<<<<< HEAD

Description. Code-block: yaml
================
```
add_users:
  <user-name-to-be-added>:
    fullname: <User Full Name>
    uid: <User ID = numerical value>
    gid: <Group ID = numerical value>
    home: <Path to home directory>
    groups:
      - <groups name>
      - <groups name>
      - And more…
    priv_keys:
      key1: <path to file.pem from salt root directory, will be copy to user-home-directory/.ssh with same name>
      key2: <path to file.pem from salt root directory, will be copy to user-home-directory/.ssh with same name>
      key…: And more…
    sudousr: <Add user to sudo user, create file in "/etc/sudoers.d/user-name-to-be-added". The value can be: True or False>

  <another-user>:
    …
    …

del_users:
  <users-that-will-be-deleted:
    absent: <Delete user. The value can be: True or False>
    purge: <Delete all of the user's files . The value can be: True or False>
    force: <Forces the removal of the user account, even if the user is still logged in. The value can be: True or False>

  <another-user>:
    …
    …
```

Example
=======
```
add_users:
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
