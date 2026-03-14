curl -L --remote-name https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz
tar xzvf cilium-linux-amd64.tar.gz
sudo mv cilium /usr/local/bin/

cilium version

cilium install \
  --version 1.15.6 \
  --set cni.chainingMode=aws-cni \
  --set enableIPv4Masquerade=false \
  --set routingMode=native \
  --set kubeProxyReplacement=disabled
