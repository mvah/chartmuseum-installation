echo "******************************** Start chartmuseum installation *************************************"
curl -LO https://s3.amazonaws.com/chartmuseum/release/latest/bin/linux/amd64/chartmuseum 
chmod +x ./chartmuseum
mv ./chartmuseum /usr/local/bin

# create a local chart directory in a chart server
mkdir chartstorage
chartmuseum --port=8080 --storage="local" --storage-local-rootdir="./chartstorage"
# After running the command, chartmuseum showing that it is start.

# Now we will add chartmuseum as a repository in the host who have Helm installation
# helm repo add chartmuseum http://116.203.125.88:8080
# helm repo update

# use the four following commands to install Helm on kubernetes master
# 1) curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
# 2) chmod 700 get_helm.sh
# 3) ./get_helm.sh
# 4) helm init

# package the chart in .tgz file (stay in a chart directory)
# helm package .
# use the following command to send chart to chartmuseum server
# curl --data-binary "@app-0.1.0.tgz" http://116.203.125.88:8080/api/charts
echo "******************************** End chartmuseum installation *************************************"

