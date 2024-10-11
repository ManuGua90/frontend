# Usa una imagen de Node.js como base
FROM node:18.17.0

# Establece el directorio de trabajo
WORKDIR /usr/src/app

# Copia el package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos
COPY . .

# Compila la aplicación Angular
RUN export NODE_OPTIONS=--openssl-legacy-provider && npm run build

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 4200

# Configura la variable de entorno NODE_OPTIONS
ENV NODE_OPTIONS=--openssl-legacy-provider

# Inicia la aplicación
CMD ["npm", "start"]