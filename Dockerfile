FROM continuumio/anaconda3

#Copy in the current directory
ADD . $HOME/

#Update Linux
RUN apt-get update \
&& apt-get -y install liblapack-dev libopenblas-dev gcc g++

#Create conda environment from file
RUN conda env create -n python3_cfr --file environment.yml

#Add graphem and deps to conda environment
RUN conda run --live-stream --no-capture-output -n python3_cfr python -m pip install blosc2~=2.0.0 Cython cfr-graphem==0.4.0

#Setup shell params
SHELL ["conda", "run", "-n", "python3_cfr", "/bin/bash", "-c"]

#set path to conda environment
ENV PATH /opt/anaconda3/envs/python3_cfr/bin:$PATH

#run the python script within the conda environment
CMD ["conda", "run", "--live-stream", "--no-capture-output", "-n", "python3_cfr", "python", "cfr_main_code.py"]

#bring output to read/write layer
COPY recons/ recons/

RUN ls -alh
