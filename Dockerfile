FROM ubuntu

# Install wget
RUN apt-get update && apt-get install -y wget

# Install fpc
RUN wget "https://sourceforge.net/projects/freepascal/files/Linux/2.6.4/fpc-2.6.4.arm-linux.tar/download" -O fpc.tar
RUN tar -xf fpc.tar
RUN echo "\n\n\n\n\n\n" > "prompts"
RUN cd fpc-2.6.4.arm-linux && echo "" | bash ./install.sh < ../prompts

# Compile
WORKDIR /app
COPY . .
RUN fpc main.pas

# Run
CMD ["./main"]
