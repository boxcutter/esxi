echo "==> Open up outgoing firewall ports 443 and 80"
esxcli network firewall ruleset set -e true -r httpClient
# Install ESXI MAC LEARNING DVFILTER directly from VMware website, make
# sure you have internet connection available or change the URL to a local
# one.
echo "==> Downloading Mac Learn dvFilter to improve performance in promiscuous mode"
esxcli software vib install -v https://download3.vmware.com/software/vmw-tools/esxi-mac-learning-dvfilter/esx-dvfilter-maclearn-6.5.0.vib -f
