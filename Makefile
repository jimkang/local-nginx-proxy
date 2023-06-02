update-local: push-up-nginx-config restart-nginx

pull-down-nginx-config:
	cp /etc/nginx/sites-enabled/default default.nginx.conf

push-up-nginx-config: update-only-nginx-config
# You can put other stuff here, like htpasswd stuff.

restart-nginx:
	service nginx restart

update-only-nginx-config:
	cp default.nginx.conf /etc/nginx/sites-enabled/default

run-test-app:
	python -m http.server
