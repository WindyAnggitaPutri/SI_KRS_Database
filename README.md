<h1> 📚 SISTEM INFORMASI KRS</h1>
<hr>
<h3>- Tugas Database: <br></h3>
Mendesain database (ERD) <br>
Membuat relasi tabel di MySQL <br>

<hr>
<h2>1. Mendesain Database(ERD)</h2>
ERD Database (Entity Relationship Diagram) => ERD dibawah ini merupakan tugas pertama yang saya dapatkan, ERD saya buat untuk memudahkan saya membuat query query dam memudahan saya membuat table table beserta relasinya.

![image](https://github.com/user-attachments/assets/a86f4c10-dc6f-46c0-8974-08c7b7a4f1a8) <br> 
Dari gambar ERD diatas dapat dilihat bahwa terdapat 6 table yaitu user, mahasiswa, kelas, prodi, mata kuliah dan krs. Masing - masing table memiliki relasinya sendiri, yang dimana dapat digunakan untuk menggabungkan beberapa table dalam satu table. 
Penjelasan relasi table : <br>
1. Mahasiswa, kelas , prodi : table prodi dan kelas keduanya terhubung ke dalam table mahasiswa, yang dimana tujuannya yaitu untuk menarik id_kelas dan juga kode_prodi, yang dimana juga akan menampilkannya di table mahasiswa
2. Mata Kuliah, Mahasiswa, KRS : table mahasiswa dan mata kuliah juga terhubung ke krs karena di table krs nanti akan menampilkan id_krs, npm, nama_mahasiswa, nama_kelas, nama_prodi, nama_matkul, sks, semester 

<h2>2. Membuat relasi tabel di MySQL </h2>
- Membuat Database terlebih dahulu dengan nama db_
