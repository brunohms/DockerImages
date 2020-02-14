FROM google/cloud-sdk:slim
# Installing Linux essentials, OpenJDK-11 and maven
RUN apt-get update -yqq
RUN apt-get install apt-utils util-linux coreutils binutils findutils grep wget procps net-tools default-jdk maven -yqq
# Checking java and maven versions
RUN java -version
RUN mvn --version