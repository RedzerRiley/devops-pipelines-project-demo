# Stage 1: Build dependencies
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Stage 2: Production image
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./
RUN npm ci --production
CMD ["npm", "start"]
