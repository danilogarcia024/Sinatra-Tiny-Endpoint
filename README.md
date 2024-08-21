# Sinatra-Tiny-Endpoint

Sinatra Tiny Endpoint to get the first day of the month and the last day of the month when the current date is provided.

Starting production image:
docker build -t gapps-sinatra-img -f docker/prod.Dockerfile .
docker run --name gapps-sinatra -dp 4567:4567 gapps-sinatra-img
