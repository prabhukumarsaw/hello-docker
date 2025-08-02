# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install pnpm and dependencies
RUN corepack enable && corepack prepare pnpm@latest --activate

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the rest and build
COPY . .
RUN pnpm build

# Start app
EXPOSE 3091
CMD ["pnpm", "start"]
