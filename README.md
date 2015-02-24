moinmoin-wiki-httpauth
=============

Docker image with the Moinmoin wiki engine, uwsgi, nginx, self signed SSL, and basic http auth.

You can automatically download and run this with the following command
    
    sudo docker run -it -p 443:443 -p 80:80 --name my_wiki hosay/moinmoin-wiki-httpauth
    
Default superuser is `mmAdmin`, you activate him by creating a new Moinmoin user named `mmAdmin` and set your prefered password.
The pages are mounted as volume, so you can take backup of the system from the host.

Default http auth user is admin, you set the password on the prompt after docker run.

You can detach from the container session with `CTRL-Q+P` and then `CTRL-C`
