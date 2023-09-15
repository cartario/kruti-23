# Этап 1: Сборка и установка зависимостей для клиента (React)
FROM node:latest AS build-client

# Установка рабочей директории
WORKDIR /app/client

# Копирование package.json и package-lock.json для установки зависимостей
COPY client/package*.json ./

# Установка зависимостей
RUN npm install

# Копирование исходного кода React-приложения
COPY client/ ./

# Сборка React-приложения
RUN npm run build

# Этап 2: Установка зависимостей для сервера (NestJS)
FROM node:latest AS install-server-deps

# Установка рабочей директории
WORKDIR /app/nestjs

# Копирование package.json и package-lock.json для установки зависимостей
COPY nestjs/package*.json ./

# Установка зависимостей для сервера
RUN npm install

# Этап 3: Запуск серверной части (NestJS)
FROM node:latest

# Установка рабочей директории для сервера
WORKDIR /app/nestjs

# Копирование установленных зависимостей из этапа 2
COPY --from=install-server-deps /app/nestjs/node_modules ./node_modules

# Копирование исходного кода сервера
COPY nestjs/ ./

# Копирование собранного React-приложения из этапа 1
COPY --from=build-client /app/client/build ./client/build

# Указание порта, который будет слушать NestJS (замените 3000 на нужный порт)
# EXPOSE 3000

# Команда для запуска NestJS-приложения
CMD ["npm", "start"]
