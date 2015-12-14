nginx-auth-proxy
================

Proxy to another service atting HTTP BASIC auth

Usage
=====

To run this in front of e.g a Jenkins container (which listens on port 8080)

     docker run --name jenkins jenkins
     docker run -p 80:80 --link jenkins:service --name testing -e SERVICE_PORT=8080 -e REALM=jenkins --restart=always jenkins-auth-proxy

Configuration
=============

Proxy
-----

The proxy always tries foward to a service named "service", which can be added to docker either via link or by the "-add-host" argument.  

The environment variable SERVICE_PORT controls the port to which traffic is proxied


htpasswd file
-------------

The "htpasswd" file lives in /etc/nginx/htpasswd.  It is an [apache
style](https://httpd.apache.org/docs/2.2/programs/htpasswd.html)
htpasswd file containing usernames and passwords.  This container
makes no provision for managing that file.

You can map the file to a host file with "docker -v" or create a
deraviative image and add your own htpasswd file to the image.

The default username/password is "user/user".

TODO
====
* Add SSL support