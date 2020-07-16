# ft_server_42

In order to start Docker properly you may want to run:
    ```bash srcs/init_docker.sh```.

In order to construct the image use the following command at the root of the repository:
    ```docker build -t ft_server_image .``` 
The whole building may take several minutes.

To launch the container run 
    ```docker run --name ft_server_running -d -p 80:80 -p 443:443 ft_server_image```.

Via https://localhost/ you can access Wordpress.

Via https://localhost/phpmyadmin you can access phpmyadmin (login : root, no password).

You can gt into the running container by using the following command: 
```docker exec -it running bash```.
Nano is installed.

The container will run until you stop it using:
    ```docker stop ft_server_running```.
