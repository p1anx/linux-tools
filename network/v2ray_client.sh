#!/bin/bash
function v2ray_client(){
  wget -O install-release.sh "https://fedhpg.ph.files.1drv.com/y4mAi55D4KGKQBPqmPrf9Y-9E9ERKDbFYP66TwcughiEQSamvxylOdIvzRFUA8-ioxY28pe4Cj4GwRjxN_xoMKWuasH6zICiULi5BiR_mr9R2bIddsejJAwP-5Ve-MNcRbkI-r095DPhpqDpIGcWTB0c2JyGFqKPueKbo-8PXWyPCqlbDxRqHS_u_qH7xvQHKpfkoHb4gGEY3kOi819hZzs5Q"
  sudo bash install-release.sh

  wget -O config.json "https://fecmkg.ph.files.1drv.com/y4mCDSV64ekOYbsT8TnNK_9SH8-f090W3bySyT1g0JWwT-OrcX-TAOWcM1_duMmeyvdxN578rCFt2NaToc6cvt4WFH5SEtlIOdRyMPyM6T-AtRoESB6wadB7r4bJWko80OeIPcw0_71tZXFyjSifXIGisTVQtTwjyIEmWagMyMPRAAFNftkbtjOC8zTWFzTVKvxOMblRiNlx-FGvQBEKedh-Q"
  sudo cp config.json /usr/local/etc/v2ray/
  sudo systemctl start v2ray
  sudo systemctl enable v2ray
  sudo tee -a /etc/profile <<EOF
function von(){
  export http_proxy="http://127.0.0.1:10809"
  export https_proxy="http://127.0.0.1:10809"
  echo "v2ray proxy is ON"
}

function voff(){
  unset https_proxy
  unset http_proxy
  echo "v2ray proxy is OFF"
}
EOF
  env | grep proxy
  echo 'v2ray is configured, please "source /etc/profile"'
  
}
