service mysql start
cat /var/www/html/wordpress/phpmyadmin/sql/create_tables.sql | mysql -u root
