CREATE VIEW v_daftar_mahasiswa AS
SELECT
    mahasiswa.npm, 
    mahasiswa.nama_mahasiswa, 
    kelas.nama_kelas, 
    prodi.nama_prodi
FROM
    mahasiswa
    INNER JOIN kelas ON mahasiswa.id_kelas = kelas.id_kelas
    INNER JOIN prodi ON mahasiswa.kode_prodi = prodi.kode_prodi;
