CREATE TABLE mahasiswa (
    npm VARCHAR(30) PRIMARY KEY, 
    nama_mahasiswa VARCHAR(50) NOT NULL,
    id_kelas INT NOT NULL,
    kode_prodi CHAR(8) NOT NULL,
    FOREIGN KEY (id_kelas) REFERENCES  kelas (id_kelas) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (kode_prodi) REFERENCES  prodi (kode_prodi) ON DELETE CASCADE ON UPDATE CASCADE
);