add_users:
  user11:
    name: User11
    fullname: User 11
    uid: 1011
    gid: 1011
    home: /home/user_11
    groups:
      - tty
      - users
    priv_keys:
      key1: ubuntu.pem
      key2: ubuntu2.pem
      key3: ubuntu3.pem
    sudousr: False

  redhat:
    name: Redhat
    fullname: RedHat
    uid: 1012
    gid: 1012
    home: /home/redhat
    groups:
      - tty
      - users
    priv_keys:
      key1: ubuntu.pem
      key2: ubuntu1.pem
    sudousr: True

del_users:
  canonical:
    absent: True
    purge: True
    force: True

