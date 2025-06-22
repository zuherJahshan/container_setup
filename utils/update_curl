#!/bin/bash

# RUN ONLY ONCE!!!
sudo mv /usr/bin/curl /usr/bin/curl-original
sudo bash -c 'echo -e "#!/bin/sh\nexec /usr/bin/curl-original -k \"\$@\"" > /usr/bin/curl'
sudo chmod +x /usr/bin/curl
