FROM google/cloud-sdk:latest
#Installing Java
RUN apt-get update -y -qq && apt-get upgrade -y -qq
RUN apt-get install default-jre -y -qq
RUN apt-get install default-jdk -y -qq
RUN apt-get install software-properties-common -y -qq
RUN add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
RUN apt-get update -y -qq
RUN java -version
#Installing maven
RUN apt-get install maven -y -qq
RUN mvn --version