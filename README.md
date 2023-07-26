## How to run the container:
launch docker on your local machine  
open a shell and navigate to an designated directory  
the directory needs the configs.yml file and a directory named recons  
make any edits you wish to the configs.yml file  
run the following command  
docker run -it -v "$(pwd)"/recons:/recons -v "$(pwd)"/configs.yml:/configs.yml davidedge/lipd_webapps:graph_em  
