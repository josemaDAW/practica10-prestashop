CREATE USER IF NOT EXISTS user@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* to pma_user@'%';
FLUSH PRIVILEGES;