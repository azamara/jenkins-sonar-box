CREATE DATABASE sonar DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES on  sonar.*  to 'sonar'@'%' IDENTIFIED BY 'sonar' WITH GRANT OPTION;
flush privileges;