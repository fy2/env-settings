confirm() {
  echo -n "Do you want to run: $*? [N/y] "
  read -N 1 REPLY
  echo

  if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
    "$@"
  else
    echo "Cancelled by user"
  fi
}

if [[ -n $(ls /tmp | grep -P "^(ttc|vx)" ) ]]; then
  echo 'sudo chown -R feyruz.feyruz /tmp/ttc* /tmp/vx*'
  sudo chown -R feyruz.feyruz /tmp/ttc* /tmp/vx* /tmp/FEYRUZ*.log /tmp/sql.*txt
fi

confirm rm -Rf /tmp/ttc* /tmp/vx* /tmp/FEYRUZ*.log /tmp/sql.*txt
