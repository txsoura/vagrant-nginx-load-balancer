sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install nginx -y && sudo apt-get install siege -y

rm -f /etc/nginx/sites-avaliable/default
rm -f /etc/nginx/sites-enabled/default

mv /tmp/nginx/nginx.conf /etc/nginx/sites-available/nginx.conf
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

sudo service nginx restart

siege -t1 -c30 http://balancer
