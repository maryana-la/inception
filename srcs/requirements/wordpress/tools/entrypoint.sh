#!/bin/sh
if  [ ! -f /var/www/html/wp-config.php ];
then

#download wordpress & set db
	wp core download --allow-root --locale=ru_RU --version=latest --force --path='/var/www/html'
	wp core config --allow-root \
	  --dbname=$MYSQL_DATABASE \
	  --dbuser=$MYSQL_USER \
	  --dbpass=$MYSQL_PASSWORD \
	  --dbhost=mariadb:3306

#create admin & start page
	wp core install --allow-root \
	  --url=$DOMAIN_NAME \
	  --title='My awesome project' \
	  --admin_user=$WP_ADMIN_USER \
	  --admin_password=$WP_ADMIN_PASS  \
	  --admin_email=$WP_ADMIN_EMAIL \
	  --path='/var/www/html'

#create another user
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=editor

#customize start page
	wp theme install --allow-root inspiro --activate
	wp post create --allow-root --post_title="Inception" --post_author=1 --post_status=publish --post_content="One container is not enough. We need to go deeper"
	wp comment update --allow-root 1 --comment_author=$WP_ADMIN_USER --comment_content="Docker is the future!"
	wp comment create --allow-root --comment_post_ID=2 --comment_content="Docker is the future!" --comment_author=$WP_USER
	wp comment create --allow-root --comment_post_ID=1 --comment_content="hello peer! How is it going?" --comment_author=$WP_USER
	wp comment generate --allow-root --format=ids --count=3 --post_id=1

fi

exec "$@"
