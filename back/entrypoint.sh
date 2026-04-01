#!/bin/sh
set -e

# Wait for database to be ready
echo "Aguardando banco de dados..."
sleep 5

# Generate APP_KEY if not set
if [ -z "$APP_KEY" ]; then
  php artisan key:generate --force
fi

# Generate JWT_SECRET
php artisan jwt:secret --force 2>/dev/null || true

# Run migrations
php artisan migrate --force

# Run seeders (ignore error if already seeded)
php artisan db:seed --force 2>/dev/null || true

# Execute the main command (php artisan serve)
exec "$@"
