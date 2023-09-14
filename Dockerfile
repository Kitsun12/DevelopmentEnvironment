# Utiliser une image de base
FROM node:alpine

LABEL maintainer "eric.muellenbach@yncrea.fr"

# Créer un utilisateur non root
RUN adduser -D myuser

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier votre application
COPY app.js .

# Changer le propriétaire du fichier app.js à l'utilisateur non root
RUN chown myuser:myuser app.js

# Basculer vers l'utilisateur non root
USER myuser

# Commande d'entrée
CMD [ "node", "app.js" ]
