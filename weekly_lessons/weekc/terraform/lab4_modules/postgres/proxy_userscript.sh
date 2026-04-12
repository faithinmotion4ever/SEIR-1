metadata_startup_script = <<-EOT
#!/bin/bash

apt-get update -y
apt-get install -y nginx postgresql-client wget

# Download Cloud SQL Auth Proxy
wget https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.8.0/cloud-sql-proxy.linux.amd64 -O /usr/local/bin/cloud-sql-proxy
chmod +x /usr/local/bin/cloud-sql-proxy

# Start proxy in background
/usr/local/bin/cloud-sql-proxy ${var.connection_name} --port 5432 &

sleep 5

# Connect WITHOUT password (if IAM DB auth later) OR still use user for now
psql -h 127.0.0.1 -U ${var.db_user} -d ${var.db_name} -c '\l'

echo "🔥 Proxy connection active" > /var/www/html/index.html
EOT
