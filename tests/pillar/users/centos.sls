add_users:
  user21:
    name: User21
    fullname: User 21
    uid: 1021
    gid: 1021
    home: /home/user_21
    groups:
      - tty
      - users
    priv_keys:
      key1: centos.pem
      key2: centos1.pem

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

