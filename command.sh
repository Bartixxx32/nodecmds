docker system prune -a -f
docker system prune --volumes -f
service nginx stop
sleep 5
certbot renew --quiet --deploy-hook "systemctl restart nginx"
sleep 5
sudo service nginx start
