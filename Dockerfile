# Usar uma imagem base do Go
FROM golang:1.22-alpine

# Instalar ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar os arquivos go.mod e go.sum para o diretório de trabalho
COPY go.mod go.sum ./

# Baixar as dependências
RUN go mod download

# Copiar o código-fonte para o container
COPY . .

# Compilar o binário do Go
RUN go build -o main .

# Expor a porta definida
EXPOSE 4040

# Comando para rodar o servidor
CMD ["./main"]
