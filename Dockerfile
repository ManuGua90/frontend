FROM node:18.17.0
# Establece el directorio de trabajo
WORKDIR /usr/src/app
# Copia el package.json y package-lock.json
COPY package*.json ./
# Instala las dependencias
RUN npm install
RUN export NODE_OPTIONS=--openssl-legacy-provider
# Copia el resto de los archivos
COPY . .
# Compila la aplicación Angular
#RUN npm run build --prod
RUN export NODE_OPTIONS=--openssl-legacy-provider && npm run build
# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 4200
# Inicia la aplicación
#RUN export NODE_OPTIONS=--openssl-legacy-provider && npm start
#CMD ["npm", "start"]
CMD ["export","NODE_OPTIONS=--openssl-legacy-provider"]
ENTRYPOINT ["npm","start"]