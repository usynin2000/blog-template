#!/bin/bash

set -e

echo "🚀 Starting deploying blog..."

echo "Stoping old containers..."
docker-compose -f docker-compose.prod.yml -f docker-compose.nginx.yml down

echo "Removing old images..."
docker image prune -f

echo "Starting new containers..."
docker-compose -f docker-compose.prod.yml -f docker-compose.nginx.yml up -d --build

echo "Waiting services..."
sleep 10

echo "Check status..."
docker-compose -f docker-compose.prod.yml -f docker-compose.nginx.yml ps

echo "✅ Deployment completed! Blog should be available at your domain."
