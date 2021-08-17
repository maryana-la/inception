sed -i -r 's/autoindex on;/autoindex off;/' ./etc/nginx/sites-enabled/default
service nginx restart
