# Usando uma imagem PHP com Apache como base
FROM php:7.4-apache

# Instalando dependências
RUN apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    odbc-mysql \
    odbcinst1debian2 \
    libcurl4-openssl-dev \
    libncurses5-dev \
    git \
    build-essential \
    lshw \
    libjansson-dev \
    libssl-dev \
    sox \
    sqlite3 \
    libsqlite3-dev \
    libxml2-dev \
    uuid-dev \
    && rm -rf /var/lib/apt/lists/*

# Configurando PHP
RUN sed -i 's/register_argc_argv = Off/register_argc_argv = On/g' /usr/local/etc/php/php.ini-production \
    && mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Clonando ou baixando o código do SNEP
# Se você tiver uma conta no Bitbucket e um fork:
# RUN git clone __seu_fork_do_snep__ /var/www/html/snep
# Caso contrário, baixe e extraia:
RUN wget -c https://sourceforge.net/projects/snep/files/snep/snep-3/snep_3.06.2.tar.gz \
    && tar -xvf snep_3.06.2.tar.gz \
    && mv snep-3 /var/www/html/snep

# Ajustando permissões e criando diretórios
WORKDIR /var/www/html/snep
RUN find . -type f -exec chmod 640 {} \; -exec chown www-data:www-data {} \; \
    && find . -type d -exec chmod 755 {} \; -exec chown www-data:www-data {} \; \
    && chmod +x /var/www/html/snep/agi/* \
    && mkdir /var/log/snep \
    && touch /var/log/snep/ui.log \
    && touch /var/log/snep/agi.log \
    && chown -R www-data:www-data /var/log/snep

# Copiando arquivos de configuração do Apache e do Asterisk
COPY ./install/etc/ /etc/
COPY ./install/snep.apache2 /etc/apache2/sites-available/001-snep.conf

# Configurando links simbólicos
RUN ln -s /var/log/snep /var/www/html/snep/logs \
    && ln -s /var/www/html/snep/agi/ /var/lib/asterisk/agi-bin/snep \
    && ln -s /var/www/html/snep/arquivos /var/spool/asterisk/monitor \
    && ln -sf /var/lib/asterisk/moh/ /var/www/html/snep/sounds/moh \
    && ln -sf /var/lib/asterisk/sounds/pt_BR/ /var/www/html/snep/sounds/pt_BR

# Configurando sons do Asterisk - Baixar os pacotes de som antes de executar o docker-compose
WORKDIR /var/www/html/snep/install/sounds
RUN mkdir -p /var/lib/asterisk/sounds/en /var/lib/asterisk/sounds/es /var/lib/asterisk/sounds/pt_BR \
    && tar -xzf asterisk-core-sounds-en-wav-current.tar.gz -C /var/lib/asterisk/sounds/en \
    && tar -xzf asterisk-extra-sounds-en-wav-current.tar.gz -C /var/lib/asterisk/sounds/en \
    && tar -xzf asterisk-core-sounds-es-wav-current.tar.gz -C /var/lib/asterisk/sounds/es \
    && tar -xzf asterisk-core-sounds-pt_BR-wav.tgz -C /var/lib/asterisk/sounds/pt_BR \
    && mkdir -p /var/lib/asterisk/sounds/es/tmp /var/lib/asterisk/sounds/es/backup /var/lib/asterisk/sounds/en/tmp /var/lib/asterisk/sounds/en/backup /var/lib/asterisk/sounds/pt_BR/tmp /var/lib/asterisk/sounds/pt_BR/backup \
    && chown -R www-data:www-data /var/lib/asterisk/sounds

# Configurando Music on Hold
WORKDIR /var/lib/asterisk/moh
RUN mkdir tmp backup \
    && chown -R www-data:www-data * \
    && rm -f *-asterisk-moh-opsound-wav

# Expondo a porta do Apache
EXPOSE 80

# Comando para iniciar o Apache
CMD ["apache2-foreground"]
