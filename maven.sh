#!/bin/bash

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install OpenJDK 17
sudo apt install openjdk-17-jdk -y

# Verify Java version
java -version

# Download and extract Apache Maven
wget https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar xf apache-maven-3.9.6-bin.tar.gz -C /opt

# Create a symbolic link for Maven
sudo ln -s /opt/apache-maven-3.9.6 /opt/maven

# Configure environment variables
sudo tee /etc/profile.d/maven.sh <<EOF
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=\${M2_HOME}/bin:\${PATH}
EOF

# Make the script executable
sudo chmod +x /etc/profile.d/maven.sh

# Reload environment variables
source /etc/profile.d/maven.sh

# Verify Maven installation
mvn -version
