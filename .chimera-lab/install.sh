APP_PATH=$(dirname ${BASH_SOURCE[0]%/*})/original.topic/chimera-lab-cli.app

if [[ $1 != "" ]]; then
  echo "bundling";
  tar -czf chimera-lab-cli.tar.gz -C "$(dirname "$APP_PATH")" "$(basename "$APP_PATH")";
  echo "copying";
  scp chimera-lab-cli.tar.gz $1:~/Desktop/;
  echo "cleaning";
  rm chimera-lab-cli.tar.gz;
  echo "extracting remotely";
  ssh $1 "tar -xzf ~/Desktop/chimera-lab-cli.tar.gz -C ~/Desktop && rm ~/Desktop/chimera-lab-cli.tar.gz";
  echo "do: source ~/Desktop/$(basename "$APP_PATH")/.venv/bin/activate";
else
  echo "do: source ~/Desktop/chimera-lab.org/original.topic/$(basename "$APP_PATH")/.venv/bin/activate";
fi
