# ft_server_42

1- to start Docker properly you may want to run:
   ```bash srcs/init_docker.sh```.

2- to build the image use the following command at the root of the repository:
    ```docker build -t ft_server_image .``` 
The whole building may take several minutes.

3-To launch the container run 
    ```docker run --name ft_server_running -d -p 80:80 -p 443:443 ft_server_image```.

Via https://localhost/ you can access Wordpress.

Via https://localhost/phpmyadmin you can access phpmyadmin (login : root, no password).

You can gEt into the running container by using the following command: 
    ```docker exec -it ft_server_running bash```.
Nano is installed.

4- The container will run until you stop it:
    ```docker stop ft_server_running```.
