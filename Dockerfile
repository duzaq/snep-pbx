# Dockerfile
FROM btscp/snep:latest

# Configura o ServerName do Apache para evitar avisos
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copia o arquivo de configuração customizado para o PHP
COPY custom.ini /usr/local/etc/php/conf.d/custom.ini

# Expõe a porta 80
EXPOSE 81

# Define o diretório de trabalho
WORKDIR /var/www/html

# Comando padrão para iniciar o serviço
CMD ["apache2-foreground"]
