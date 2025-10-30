# Stage 1: Builder (builds and compiles your app)
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files first (improves caching)
COPY package*.json ./

# Install all dependencies (including devDeps)
RUN npm ci

# Copy all source code and build the app
COPY . .
RUN npm run build

# Stage 2: Production (only what’s needed to run)
FROM node:18-alpine
WORKDIR /app

# Copy only built files and essential dependencies
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

# Install only production dependencies
RUN npm ci --production

EXPOSE 3000
CMD ["node", "dist/server.js"]
