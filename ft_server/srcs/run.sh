service mysql start
service php7.3-fpm start
service nginx start

echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root --skip-password
echo "create database wordpress;" | mysql -u root --skip-password
echo "grant all privileges on wordpress.* to 'admin'@'localhost' identified by 'admin';"| mysql -u root --skip-password
echo "flush privileges;" | mysql -u root --skip-password

bash