docker build -t morsh92/skillfactory-web-pg:$args -t morsh92/skillfactory-web-pg:latest .;
if($?){
docker push morsh92/skillfactory-web-pg:$args;
docker push morsh92/skillfactory-web-pg:latest;     
}