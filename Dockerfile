FROM python:3.8.5
EXPOSE 3001
RUN pip install aws-sam-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN apt-get update && apt-get install -y groff
RUN mkdir /app
WORKDIR /app
COPY sam_entrypoint.sh /app
RUN chmod 777 sam_entrypoint.sh
ENTRYPOINT ["/app/sam_entrypoint.sh"]