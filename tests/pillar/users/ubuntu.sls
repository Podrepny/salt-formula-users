add_users:
  redhat:
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
    sudousr: False

del_users:
  canonical:
    absent: True
    purge: True
    force: True
