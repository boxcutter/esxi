echo "==> Enabling guest IP hack"
esxcli system settings advanced set -o /Net/GuestIPHack -i 1
echo "==> Open up incoming ports for VNC"
esxcli network firewall ruleset set -e true -r gdbserver
