#!/bin/bash

encrypted=".private"
decrypted="private"
action=$1

case ${action} in
  mount)
    encfs ~/${encrypted} ~/${decrypted}
  ;;
  umount)
    fusermount -u ${decrypted}
  ;;
  *)
    echo -e "\nUsage: $0 mount|umount\n"
    exit 1
  ;;
esac

exit 0
