FROM node:lts-alpine3.20

# Create app group and user
RUN addgroup app && adduser -S -G app app

# Set working directory and adjust permissions
WORKDIR /app
COPY package*.json .
RUN chown -R app:app /app

# Switch to the app user
USER app
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 5173
EXPOSE 5173

# Start the application
# CMD ["npm", "start"]

# Start the application with --host flag since Vite is not exposing the application to the network by default
CMD ["npm", "run", "dev", "--", "--host"]