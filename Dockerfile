FROM node:10-buster

RUN curl --silent --show-error --location --fail --retry 3 --output /tmp/zulu8.50.0.21-ca-jdk8.0.272-linux_x64.tar.gz https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-jdk8.0.272-linux_x64.tar.gz && \
  tar xf /tmp/zulu8.50.0.21-ca-jdk8.0.272-linux_x64.tar.gz -C /opt/ && \
  rm /tmp/zulu8.50.0.21-ca-jdk8.0.272-linux_x64.tar.gz   &&\
  ln -s /opt/zulu8* /opt/java   &&\
  /opt/java/bin/java -version

ENV JAVA_HOME=/opt/java

# Install Maven Version: 3.6.3
RUN curl --silent --show-error --location --fail --retry 3 --output /tmp/apache-maven.tar.gz     https://www.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz   && \
  tar xf /tmp/apache-maven.tar.gz -C /opt/   &&\
  rm /tmp/apache-maven.tar.gz   &&\
  ln -s /opt/apache-maven-* /opt/apache-maven   &&\
  /opt/apache-maven/bin/mvn -version
