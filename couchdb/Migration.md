# How to migrate CouchDB from your local machine to docker

We don't actually 'migrate' your data, we just need to create a temp container so it can run along with your local one. Then we replicate your local data into the container one and the container will persist the data to the 'data' folder.

## Run `migrate.ps1` 
In powershell
``` Powershell
PS D:\docker\dev-workspace\couchdb> .\migrate.ps1
```
Or Command Line
```
D:\docker\dev-workspace\couchdb>powershell -File migrate.ps1
```
![migrate](http://imagizer.imageshack.us/a/img923/6056/NaaQqj.gif)

## Go replicate your data

Open your browser for the [new CouchDB](http://127.0.0.1:5988/_utils/) server on your local.

Login using the user/password for the CouchDB. 
> The couch in container needs to be configured as a 'cluster' instead of of 'single node'. [Here is a simple instruction](http://imagizer.imageshack.us/a/img923/35/iZAWSa.gif) to setup.

Open the tab 'Replication'
![Replication Page](http://imagizer.imageshack.us/a/img922/6200/Gf3K5X.gif)

The `Remote` address is actually the database url that directing to our local(gateway IP for your docker network, 172.17.0.1 in my case) and the `Local` is the server itself that stroring docker data.

Fill the two box with
```
http://couchuser:couchpass@172.17.0.1:5984/membership
```
Replace `couchuser` with your DB user name
Replace `couchpass` with your DB password
Replace `172.17.0.1:5984` with the IP address that prompted in the command line window.
Replace `membership` with your database name needs to migrate and it should be same with the value in the `Local` box.

Click 'Replicate' to start transfer data from one side to another. Because it's a one time job so leave the `Continuous` unchecked.

You can get a list of your database on your local by viewing [http://127.0.0.1:5984/_all_dbs](http://127.0.0.1:5984/_all_dbs) and migrate what you need (DB starts with _ is Couch built-in database).

![Databases](http://imageshack.com/a/img924/1585/f20Jnr.png)

## Remove Container

After all to replication, go back to the command line window and press any key to continue running.
![Remove Container](http://imagizer.imageshack.us/a/img922/9854/mg1Ua6.gif)