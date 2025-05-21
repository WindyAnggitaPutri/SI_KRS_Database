CREATE TABLE user (
    id_user INT(5) AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(20) NOT NULL,  
    password VARCHAR(10) NOT NULL,
    status ENUM('mahasiswa', 'admin') NOT NULL
);
