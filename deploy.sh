docker build -t hugodiwang/multi-client -f ./client/Dockerfile ./client
# for updating the images
# docker build -t hugodiwang/multi-client:latest -t hugodiwang/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hugodiwang/multi-server -f ./server/Dockerfile ./server
docker build -t hugodiwang/multi-worker -f ./worker/Dokcerfile ./worker
docker push hugodiwang/multi-client
# for updating the images
# docker push hugodiwang/multi-client:latest
# docker push hugodiwang/multi-client:$SHA
docker push hugodiwang/multi-server
docker push hugodiwang/multi-worker
kubectl apply -f k8s
# for updating the images
# kubectl set image deployments/server-deployment server=hugodiwang/multi-server:$SHA