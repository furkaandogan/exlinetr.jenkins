upstream jenkinsexlinetr{
    server 127.0.0.1:5050;
}

server{
    listen 80 ;
    listen [::]:80;

    server_name jenkins.exlinetr.com;
    
    location / {
        proxy_pass http://jenkinsexlinetr;
    }
}

