#!/bin/bash

export MYSQL_ROOT_USER=${MYSQL_ROOT_USER:-"root"}
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"admin123"}
export MYSQL_HOST=${MYSQL_HOST:-"localhost"}

export MYSQL_DB_NAME=${MYSQL_DB_NAME:-"testdb"}
export MYSQL_DB_USER=${MYSQL_DB_USER:-"testdb"}
export MYSQL_DB_PASSWORD=${MYSQL_DB_PASSWORD:-"testdb123"}

Q1="CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"
Q2="GRANT USAGE ON *.* TO $MYSQL_DB_USER@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';"
Q3="GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO $MYSQL_DB_USER@'%';"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"

mysql -u "$MYSQL_ROOT_USER" -p"${MYSQL_ROOT_PASSWORD}" -e "$SQL" -h $MYSQL_HOST
