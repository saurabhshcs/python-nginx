# react-nginx
This is simple learning project of nginx

<img src="https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/nginx/logo.png"/> <img src="https://brew.sh/assets/img/homebrew-256x256.png" height="72">    <img src="https://www.python.org/static/img/python-logo@2x.png"  width="256"/>    <img src="https://webimages.mongodb.com/_com_assets/cms/kpo5kblefbjq79065-Horizontal_Default.svg?auto=format%252Ccompress" width="256">   <img src="https://www.docker.com/assets/logo-files/Docker-Logo-White-RGB_Horizontal.png" width="256"> 

### What is nginx?
> Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.


`$ docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx`

Alternatively, a simple Dockerfile can be used to generate a new image that includes the necessary content (which is a much cleaner solution than the bind mount above):

```docker
FROM nginx
COPY static-html-directory /usr/share/nginx/html
```
Place this file in the same directory as your directory of content ("static-html-directory"), run docker build -t some-content-nginx ., then start your container:

`$ docker run --name some-nginx -d some-content-nginx`


### What is MongoDB?
> MongoDB is a free and open-source cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemata. MongoDB is developed by MongoDB Inc., and is published under a combination of the Server Side Public License and the Apache License.

> First developed by the software company 10gen (now MongoDB Inc.) in October 2007 as a component of a planned platform as a service product, the company shifted to an open source development model in 2009, with 10gen offering commercial support and other services. Since then, MongoDB has been adopted as backend software by a number of major websites and services, including MetLife, Barclays, ADP, UPS, Viacom, and the New York Times, among others. MongoDB is the most popular NoSQL database system.

`$ docker run -it --network some-network --rm mongo mongo --host some-mongo test`

Example `stack.yaml` for mongo:
```yaml
services:

  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
      ME_CONFIG_MONGODB_URL: mongodb://root:example@mongo:27017/
```
### Install & configure Python, pip and Flask
- Run 'brew install python'
- then run `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py`
- then run `pip install flask`
- Now, create a file called `app.py'
    ```python
    from flask import Flask

    app = Flask(__name__)

    @app.route("/")
    def hello():
        return "hello world!"

    if __name__ == "__main__":
        app.run(host="0.0.0.0") > app.py
    ```
- Run `app.py` as `python3 app.py`






