# salt-formula-users
Develop salt formula for user control users on controlled host machines

Example
=======
configure user account definitions from configuration the pillar/users/ubuntu.sls or centos.sls:

  canonical:
    name: Canonical
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

