cp kubernetes.repo /etc/yum.repos.d/kube.repo
swapoff -a
yum repolist
yum install kubeadm docker -y
systemctl stop firewalld
systemctl start docker
systemctl enable docker
systemctl restart kubelet
systemctl enable kubelet
kubeadm init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl get nodes

