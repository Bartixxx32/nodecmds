docker system prune -a -f
docker system prune --volumes -f
service nginx stop
sleep 5
certbot renew --quiet --deploy-hook "systemctl restart nginx"
sleep 5
service nginx start
systemctl stop wings
curl -L -o /usr/local/bin/wings "https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
chmod u+x /usr/local/bin/wings
