FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./
ENV CI=true
RUN npm ci --omit=dev
CMD ["npm", "start"]
