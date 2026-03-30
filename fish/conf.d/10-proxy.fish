status is-interactive; or exit

set -gx ALL_PROXY "http://172.17.0.1:7890"
set -gx HTTP_PROXY $ALL_PROXY
set -gx HTTPS_PROXY $ALL_PROXY
set -gx http_proxy $ALL_PROXY
set -gx https_proxy $ALL_PROXY
set -gx NO_PROXY "localhost,127.0.0.1,::1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12"
set -gx no_proxy $NO_PROXY
set -gx TWITTER_PROXY $ALL_PROXY
