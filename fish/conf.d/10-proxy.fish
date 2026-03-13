set -gx ALL_PROXY "http://localhost:7890"
set -gx HTTP_PROXY $ALL_PROXY
set -gx HTTPS_PROXY $ALL_PROXY
set -gx NO_PROXY "localhost,127.0.0.1,::1"
