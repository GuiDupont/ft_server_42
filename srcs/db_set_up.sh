service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

echo "CREATE DATABASE phpmyadmin;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

