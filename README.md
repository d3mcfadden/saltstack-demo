# saltstack demo

Demo showing off saltstack for launching a cloud based environment in a
completely automated fashion using `salt-cloud` and the reactor and the
mine system.

In this demo we will auto provision a proxy (nginx) and 3 app servers
that will run our app in docker containers. The servers will come online
and run a `state.apply` to get them in the correct state. When app
servers come online we will react to them using the reactor conf and
tell nginx to query the salt mine and refresh its list of backend
servers.

* [cloud](https://docs.saltstack.com/en/latest/topics/cloud/) - auto provision cloud hosts
* [reactor](https://docs.saltstack.com/en/latest/topics/reactor/) - react to server events and kick off other events
* [mine](https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.mine.html) - master based lookup to store minion specific values

## Setup

In order to run this demo you will need to setup a salt-master using a
provider of your choice. I used digital ocean for my testing. All images
were Ubuntu 16.4 running the latest salt release.

The following commands can be run on the master to get it ready.

Install `salt-master` with `salt-cloud` support

```
curl -L https://bootstrap.saltstack.com -o install_salt.sh && sudo sh install_salt.sh -PLM
```

Clone the demo repo. From the master...

```
git clone https://github.com/d3mcfadden/saltstack-demo.git

```

Symlink files into place:

```
ln -s /path/to/repo/reactor/reactor.conf /etc/salt/master.d/reactor.conf
rm -rf /etc/salt/cloud.pro*;
ln -s /path/to/repo/cloud/cloud.profiles.d /etc/salt/cloud.profiles.d
ln -s /path/to/repo/cloud/cloud.providers.d /etc/salt/cloud.providers.d
```

## App

The app we are deploying is a simple sinatra app that runs inside of a
docker container. The app just prints out the `ENV` it was started up
with. The app container was build and pushed to docker hub. You will
need to update `d3mcfadden/saltstack-demo:latest` in
`./salt/app/server.sls` to point to your docker hub.

We use NGINX as a reverse proxy to balance the pool of app servers
behind it.


## Launching servers

Execute the following command to bring up a proxy server and 3 app
servers in parallel.

```
salt-cloud --parallel -p digitialocean-ubuntu proxy01.saltdemo.net app01.saltdemo.net app02.saltdemo.net app03.saltdemo.net
```

If all goes well you should be able to point your browser at the public
IP of your proxy and see the app.
