# Use an OpenJDK base image
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the compiled Java bytecode into the container
COPY HelloWorld.java /app

# Command to run the Java program
CMD ["java", "HelloWorld"]

