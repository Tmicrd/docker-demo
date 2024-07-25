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

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]