# Use python as base image
FROM python

# Set the working directory in the container
WORKDIR /app

RUN apt-get update
RUN apt-get install wget -y
RUN wget https://huggingface.co/TheBloke/Llama-2-7b-Chat-GGUF/resolve/main/llama-2-7b-chat.Q2_K.gguf
#RUN mv llama-2-7b-chat.Q2_K.gguf /app/llama-2-7b-chat.Q2_K.gguf

# Copy the current directory contents into the container at /app
COPY ./llama_cpu_server.py /app/llama_cpu_server.py

# Install the needed packages
RUN pip install llama-cpp-python
RUN pip install Flask

# Expose port 5000 outside of the container
EXPOSE 5000

# Run llama_cpu_server.py when the container launches
CMD ["python", "llama_cpu_server.py"]