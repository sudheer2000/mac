brew install postgresql
brew services start postgresql


brew install docker
brew install colima
colima start
docker version   # check docker is running
docker compose version   # check docker-compose is running


docker pull postgres:13

docker run -d --name my-postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-p 5432:5432 \
postgres:13

docker ps    # confirm running


docker exec -it my-postgres psql -U postgres -c "CREATE DATABASE airflowdb;"




