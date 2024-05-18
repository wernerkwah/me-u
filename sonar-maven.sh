#!/bin/bash
# Update and install dependencies
yum update -y
yum install -y wget unzip

# Install Java 11
amazon-linux-extras install java-openjdk11 -y

# Install Maven
wget http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
unzip apache-maven-3.6.3-bin.zip -d /opt
ln -s /opt/apache-maven-3.6.3 /opt/maven
echo 'export M2_HOME=/opt/maven' >> /etc/profile.d/maven.sh
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# Download and install SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.0.43852.zip
unzip sonarqube-8.9.0.43852.zip -d /opt
mv /opt/sonarqube-8.9.0.43852 /opt/sonarqube

# Set up SonarQube as a service
cp /opt/sonarqube/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
chmod +x /etc/init.d/sonar
chkconfig --add sonar

# Start SonarQube
service sonar start

# Enable SonarQube to start on boot
chkconfig sonar on
