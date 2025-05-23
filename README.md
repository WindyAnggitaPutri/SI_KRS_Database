<h1> 📚 SISTEM INFORMASI KRS</h1>
SI KRS adalah sistem informasi yang digunakan untuk memudahkan mahasiswa dalam mendapatkan krs, dan juga memudahkan pengelolaan krs yang ada di Politeknik Negeri Cilacap <br>
<hr>
<h3>📊 Tugas Database: <br></h3>
Mendesain database (ERD) <br>
Membuat relasi tabel di MySQL <br>

<hr>
<h2>1. 📦 Mendesain Database(ERD)</h2>
ERD Database (Entity Relationship Diagram) => ERD dibawah ini merupakan tugas pertama yang saya dapatkan, ERD saya buat untuk memudahkan saya membuat query query dam memudahan saya membuat table table beserta relasinya.

![image](https://github.com/user-attachments/assets/a86f4c10-dc6f-46c0-8974-08c7b7a4f1a8) <br> 
Dari gambar ERD diatas dapat dilihat bahwa terdapat 6 table yaitu user, mahasiswa, kelas, prodi, mata kuliah dan krs. Masing - masing table memiliki relasinya sendiri, yang dimana dapat digunakan untuk menggabungkan beberapa table dalam satu table. 
Penjelasan relasi table : <br>
1. Mahasiswa, kelas , prodi : table prodi dan kelas keduanya terhubung ke dalam table mahasiswa, yang dimana tujuannya yaitu untuk menarik id_kelas dan juga kode_prodi, yang dimana juga akan menampilkannya di table mahasiswa
2. Mata Kuliah, Mahasiswa, KRS : table mahasiswa dan mata kuliah juga terhubung ke krs karena di table krs nanti akan menampilkan id_krs, npm, nama_mahasiswa, nama_kelas, nama_prodi, nama_matkul, sks, semester 

<h2> 💻 2. Membuat relasi tabel di MySQL </h2>
1. Membuat Database terlebih dahulu dengan nama db_krs <br>
- Dapat membuat database di navicat 
- Klik kanan pada koneksi 
- Lalu pilih New Database dengan nama db_krs
2. Lalu membuat table dengan perintah query <b>CREATE TABLE</b>. Tujuan dari query <b>CREATE TABLE</b> adalah untuk membuat table beserta dengan struktur (kolom) dan tipe data (int, varchar dll) dan atribut table lainnya yang nantinya dapat diiisikan table yang sesuai dengan yang diinginkan. <br>
A. CREATE TABLE kelas <br>
        
          CREATE TABLE kelas (
          id_kelas INT AUTO_INCREMENT PRIMARY KEY, 
          nama_kelas VARCHAR(10) NOT NULL        
        );
        
B. CREATE TABLE prodi <br>

        CREATE TABLE prodi (
        kode_prodi CHAR(8) PRIMARY KEY, 
        nama_prodi VARCHAR(100) NOT NULL        
        );


C. CREATE TABLE mahasiswa <br>

        CREATE TABLE mahasiswa (
        npm VARCHAR(30) PRIMARY KEY, 
        nama_mahasiswa VARCHAR(50) NOT NULL,
        id_kelas INT NOT NULL,
        kode_prodi CHAR(8) NOT NULL,
        FOREIGN KEY (id_kelas) REFERENCES  kelas (id_kelas) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (kode_prodi) REFERENCES  prodi (kode_prodi) ON DELETE CASCADE ON UPDATE CASCADE
        );



D. CREATE TABLE matkul <br>

        CREATE TABLE matkul (
            kode_matkul CHAR(5)  PRIMARY KEY, 
            nama_matkul VARCHAR(50) NOT NULL,
            sks VARCHAR(5) NOT NULL,
            semester CHAR(1) NOT NULL
        );

E. CREATE TABLE krs <br>

        CREATE table krs (
        id_krs INT(5) AUTO_INCREMENT PRIMARY KEY,
        npm VARCHAR(30) NOT NULL,
        kode_matkul CHAR(5) NOT NULL, 
        CONSTRAINT unique_krs UNIQUE (npm, kode_matkul),
        FOREIGN KEY (npm) REFERENCES  mahasiswa (npm) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (kode_matkul) REFERENCES  matkul (kode_matkul) ON DELETE CASCADE ON UPDATE CASCADE
        );


F. CREATE TABLE user <br>

        CREATE TABLE user (
            id_user INT(5) AUTO_INCREMENT PRIMARY KEY, 
            username VARCHAR(20) NOT NULL,  
            password VARCHAR(10) NOT NULL,
            status ENUM('mahasiswa', 'admin') NOT NULL
        );


3. Lalu membuat quert <b>INSERT TABLE</b>. Query ini digunakan untuk mengisikan data kedalam table yang tadi sudah dibuat. <br>
A. INSERT INTO kelas <br>

        insert into kelas (nama_kelas) VALUES
        ('2C'),('2A'),('2B'),('1A'),('3A');

B. INSERT INTO prodi <br>

        insert into prodi (kode_prodi, nama_prodi) VALUES
        ('D3TE', 'Diploma III Teknik Elektro'),('D4RKS', 'Diploma IV Rekayasa Keamanan Siber'),('D4TPPL', 'Dimploma IV Teknik Pengendalian Pencemaran Lingkungan'),('D3TI','Diploma III Teknik Informatika'),('D3TM', 'Diploma III Teknik Mesin');

C. INSERT INTO mahasiswa <br>

        insert into mahasiswa (npm, nama_mahasiswa, id_kelas, kode_prodi) VALUES
        ('230102072', 'windy', '1', 'D3TI'), ('230102057', 'devi', '2', 'D4TPPL'),('230102058','mona', '3', 'D3TM'),
        ('230202059', 'eka', '4', 'D4RKS'),('230302065','dimas','5', 'D3TE');

D. INSERT INTO matkul <br>

        insert into matkul (kode_matkul, nama_matkul, sks, semester) VALUES
        ('01240','Struktur Data', '6', '2'), ('02240','Statistika', '3','1'),
        ('03240','Agama','2', '4'), ('04240','Basis Data','8','5'),('05240','K3','2','3');

E. INSERT INTO krs <br>

        insert into krs (npm, kode_matkul) VALUES
        ('230102057', '01240'), ('230102058', '02240'),('230102072', '03240'),('230202059','04240'),('230302065','05240'),('230102050', '02240'),('230102057','03240');

F. INSERT INTO user <br>

        INSERT into user (username, password, status) VALUES
        ('admin', 'admin', 'admin'),('230102072', '1234', 'mahasiswa'),('230102057','1234', 'mahasiswa'),('230102058','1234','mahasiswa'),('230202059', '1234', 'mahasiswa'),('230302065','1234', 'mahasiswa');

4. Membuat Query <b>CREATE TRIGGER</b>. Query ini digunakan untuk, pada intinya ini tuh seperti menghubungkan isi 2 table. Jika saya menambah di data mahasiswa maka akan secara otomatis di table user juga akan bertambah, maka dari itu disebut seperti terhubung. <br>
A. TRIGGER insert mahasiswa user.<br>
Jika saya menambah data di table mahasiswa, maka akan secara otomatis juga akan tertambah secara langsung di table user. <br>

        CREATE TRIGGER insert_user_mahasiswa
        AFTER INSERT ON mahasiswa
        FOR EACH ROW
        INSERT INTO User (username, password, status)
        VALUES (NEW.npm, '1234', 'mahasiswa');


B. TRIGGER hapus mahasiswa user. <br>
Jika saya menghapus salah satu / semua data di table mahasiswa maka akan secara otomatis terhapus juga di data user. <br>

        CREATE TRIGGER delete_user_mahasiswa
        AFTER DELETE ON mahasiswa
        FOR EACH ROW
        DELETE FROM User WHERE username = OLD.npm;

5. Membuat Query <b>JOIN</b>. Query JOIN ini digunakan untuk melakukan join, saya mengambil data dari table lain, contoh saya mengambil nama matkul, krs, semester di table matkul tetapi yang dipanggil adalah kode_matkul. <br>
A. JOIN krs <br>

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

B. JOIN mahasiswa <br>
        SELECT
        	mahasiswa.npm, 
        	mahasiswa.nama_mahasiswa, 
        	kelas.nama_kelas, 
        	prodi.nama_prodi
        FROM
        	mahasiswa
        	INNER JOIN
        	kelas
        	ON 
        		mahasiswa.id_kelas = kelas.id_kelas
        	INNER JOIN
        	prodi
        	ON 
        		mahasiswa.kode_prodi = prodi.kode_prodi

6. Membuat Query <b>VIEW</b>. Query ini untuk membuat tampilan dari join yang telah dibuat diatas. <br>
A. VIEW mahasiswa <br>

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

B. VIEW krs <br>

        CREATE VIEW v_krs AS
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
            INNER JOIN mahasiswa ON krs.npm = mahasiswa.npm
            INNER JOIN kelas ON mahasiswa.id_kelas = kelas.id_kelas
            INNER JOIN matkul ON krs.kode_matkul = matkul.kode_matkul
            INNER JOIN prodi ON mahasiswa.kode_prodi = prodi.kode_prodi
        ORDER BY
            mahasiswa.nama_mahasiswa, 
            matkul.nama_matkul;

7. Dokumentasi Query di atas. Query yang yang telah dibuat di atas telah di dokumentasikan.

🔗 [Dokumentasi Query (GDRIVE)](https://drive.google.com/drive/folders/1YyQ5jnc3e4fRC87JtkuOpRo41go9zAWv?usp=sharing)

