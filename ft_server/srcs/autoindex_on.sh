sed -i -r 's/autoindex off;/autoindex on;/' ./etc/nginx/sites-enabled/default
service nginx restart
