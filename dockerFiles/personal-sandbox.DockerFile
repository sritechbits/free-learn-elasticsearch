FROM alpine:3.14
RUN echo "ALPINE IS UP FOR MODIFICATION"




# Command To Build the docker Image : 
# docker build  -t mysandbox:1.0.0 -f dockerFiles/personal-sandbox.DockerFile .


# Command to run the image and get into shell
# docker run -it mysandbox:1.0.0 /bin/sh


# Notice How I am able to accesss these basic command in this shell ( which is just 5mb )
# What commands are available you can check in /bin folder
