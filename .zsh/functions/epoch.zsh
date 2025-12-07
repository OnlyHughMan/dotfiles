epoch() {
  local epoch_time

  if [ -n "$1" ]; then
    epoch_time=$1
  elif [ ! -t 0 ]; then
    read epoch_time
  else
    date +%s
    return
  fi

  echo "UTC:  $(date -u -r "$epoch_time" '+%Y-%m-%d %H:%M:%S %Z')"
  echo "AEST: $(TZ='Australia/Sydney' date -r "$epoch_time" '+%Y-%m-%d %H:%M:%S %Z')"
}
