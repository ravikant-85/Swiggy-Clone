Update your system-> 
sudo apt update && sudo apt upgrade -y

Install NVM -> 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

Load NVM -> 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

Reload -> 
source ~/.bashrc

Verify NVM Installation -> 
nvm --version

Install Node.js -> 
nvm install 18

Verify --> 	
node -v
npm -v

