# Usa la imagen base de Eclipse Temurin con JDK 17
FROM eclipse-temurin:17.0.12_7-jdk

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 9000

# Establecer el directorio de trabajo
WORKDIR /root

# Copiar los archivos de configuración de Maven y el archivo POM
COPY ./pom.xml /root
COPY ./.mvn /root/.mvn
COPY ./mvnw /root

# Descargar dependencias de Maven
RUN ./mvnw dependency:go-offline

# Copiar el código fuente de la aplicación
COPY ./src /root/src

# Compilar la aplicación
RUN ./mvnw clean install -DskipTests

# Configurar las variables de entorno para la conexión a la base de datos
ENV SPRING_DATASOURCE_URL=jdbc:mysql://pruebatecnica.czo20w4sih91.us-east-2.rds.amazonaws.com:3306/ecommercebd
ENV SPRING_DATASOURCE_USERNAME=ppadmin
ENV SPRING_DATASOURCE_PASSWORD=ppaflytest*

# Iniciar la aplicación
ENTRYPOINT ["java","-jar","/root/target/EcommerceBackendTest-0.0.1-SNAPSHOT.jar"]
