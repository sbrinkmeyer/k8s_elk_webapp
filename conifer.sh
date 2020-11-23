https://fabianlee.org/2020/03/27/ubuntu-adding-a-root-certificate-authority/
cd /usr/share/ca-certificates/
mkdir extra
cd extra/
vi 1.crt
vi 2.crt
vi 3.crt
sudo dpkg-reconfigure ca-certificates
update-ca-certificates

cat >> /etc/hosts << EOPOOP
// Do not verify peer certificate
Acquire::https::Verify-Peer "false";
// Do not verify that certificate name matches server name
Acquire::https::Verify-Host "false";
EOPOOP


// ipv4 thing
vi /etc/sysctl.conf
reboot

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

apt update && apt install -y thin-provisioning-tools lvm2 netcat apt-transport-https ca-certificates curl gnupg-agent software-properties-common docker-ce docker-ce-cli containerd.io kubelet kubeadm kubectl

# curl --insecure -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# cat > /etc/apt/apt.conf.d/30ignorehttps << EOPOOP
# // Do not verify peer certificate
# Acquire::https::Verify-Peer "false";
# // Do not verify that certificate name matches server name
# Acquire::https::Verify-Host "false";
# EOPOOP

usermod -aG docker root
usermod -aG docker vagrant

docker run hello-world
docker ls
docker --help


sudo systemctl enable --now kubelet

