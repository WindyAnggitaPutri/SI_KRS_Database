SELECT
	krs.id_krs, 
	krs.npm, 
	mahasiswa.nama_mahasiswa, 
	kelas.nama_kelas, 
	prodi.nama_prodi, 
	matkul.nama_matkul, 
	matkul.sks, 
	matkul.semester
FROM
	krs
	INNER JOIN
	mahasiswa
	ON 
		krs.npm = mahasiswa.npm
	INNER JOIN
	kelas
	ON 
		mahasiswa.id_kelas = kelas.id_kelas
	INNER JOIN
	matkul
	ON 
		krs.kode_matkul = matkul.kode_matkul
	INNER JOIN
	prodi
	ON 
		mahasiswa.kode_prodi = prodi.kode_prodi
GROUP BY
	krs.id_krs, 
	mahasiswa.nama_mahasiswa