-- --------------------------------------------------------
-- Host:                         10.0.45.10
-- Server version:               Microsoft SQL Server 2019 (RTM) - 15.0.2000.5
-- Server OS:                    Windows Server 2019 Datacenter 10.0 <X64> (Build 17763: )
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table sbrdb-dev.matcha_alokasi_petugas_assessment
CREATE TABLE IF NOT EXISTS "matcha_alokasi_petugas_assessment" (
	"id" BIGINT NOT NULL,
	"id_user" INT NULL DEFAULT NULL,
	"id_kegiatan" INT NOT NULL,
	"idsbr" INT NOT NULL,
	"is_assessment" BIT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_alokasi_petugas_matching
CREATE TABLE IF NOT EXISTS "matcha_alokasi_petugas_matching" (
	"id" BIGINT NOT NULL,
	"id_user" INT NULL DEFAULT NULL,
	"id_kegiatan" INT NOT NULL,
	"id_spool" INT NOT NULL,
	"is_matching" BIT NULL DEFAULT NULL,
	"islocked" DATETIME NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results
CREATE TABLE IF NOT EXISTS "matcha_assessment_results" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NULL DEFAULT NULL,
	"idsbr" INT NULL DEFAULT NULL,
	"alamat" VARCHAR(max) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"aset" FLOAT NULL DEFAULT NULL,
	"jam_buka" DATETIME2(7) NULL DEFAULT NULL,
	"jam_tutup" DATETIME2(7) NULL DEFAULT NULL,
	"jenis_kelamin_pengusaha" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jumlah_kamar" INT NULL DEFAULT NULL,
	"kode_pos" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kodese" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"latitude" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"longitude" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"multi_national_status" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_komersial" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_kode_area" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"npwp" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pajak_tahun_pendaftarannpwp" INT NULL DEFAULT NULL,
	"pajak_tahunspt" INT NULL DEFAULT NULL,
	"pajak_tanggal_update" DATETIME2(7) NULL DEFAULT NULL,
	"pendapatan_per_tahun" FLOAT NULL DEFAULT NULL,
	"pengeluaran_per_tahun" FLOAT NULL DEFAULT NULL,
	"pengusaha_pemilik" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"skala_usaha" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status_kepemilikan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"tahun_beroperasi" INT NULL DEFAULT NULL,
	"tahun_pendirian" INT NULL DEFAULT NULL,
	"tahun_ref_aset" INT NULL DEFAULT NULL,
	"tahun_ref_kompensasi_asing" INT NULL DEFAULT NULL,
	"tahun_ref_kompensasi_lokal" INT NULL DEFAULT NULL,
	"tahun_ref_pendapatan" INT NULL DEFAULT NULL,
	"tahun_ref_pengeluaran" INT NULL DEFAULT NULL,
	"tahun_ref_skala_usaha" INT NULL DEFAULT NULL,
	"tahun_ref_tenaga_kerja_asing" INT NULL DEFAULT NULL,
	"tahun_ref_tenaga_kerja_lokal" INT NULL DEFAULT NULL,
	"tanggal_lahir_pengusaha" DATETIME2(7) NULL DEFAULT NULL,
	"total_kompensasi_asing_per_tahun" FLOAT NULL DEFAULT NULL,
	"total_kompensasi_lokal_per_tahun" FLOAT NULL DEFAULT NULL,
	"total_tenaga_kerja_asing_per_tahun" INT NULL DEFAULT NULL,
	"total_tenaga_kerja_lokal_per_tahun" INT NULL DEFAULT NULL,
	"unit_statistik" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jaringan_usaha_id" INT NULL DEFAULT NULL,
	"jenis_badan_hukum_badan_usaha_id" INT NULL DEFAULT NULL,
	"kabupaten_kota_id" INT NULL DEFAULT NULL,
	"kbji_pengusaha_id" INT NULL DEFAULT NULL,
	"kecamatan_id" INT NULL DEFAULT NULL,
	"kelurahan_desa_id" INT NULL DEFAULT NULL,
	"kewarganegaraan_pengusaha_id" INT NULL DEFAULT NULL,
	"negara_id" INT NULL DEFAULT NULL,
	"pajak_jeniswp_id" INT NULL DEFAULT NULL,
	"pajak_skala_usaha_id" INT NULL DEFAULT NULL,
	"pajak_statuswp_id" INT NULL DEFAULT NULL,
	"provinsi_id" INT NULL DEFAULT NULL,
	"sektor_institusi_id" INT NULL DEFAULT NULL,
	"status_perusahaan_id" INT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_aktivitas
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_aktivitas" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_aktivitas_perusahaan" BIGINT NULL DEFAULT NULL,
	"aktivitas" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jenis" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kategori" VARCHAR(1) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kbli" VARCHAR(5) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_email
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_email" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_email_perusahaan" BIGINT NULL DEFAULT NULL,
	"email" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_fax
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_fax" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_fax_perusahaan" BIGINT NULL DEFAULT NULL,
	"nomor_faksimili" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_kontak_perusahaan
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_kontak_perusahaan" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_kontak_perusahaan" BIGINT NULL DEFAULT NULL,
	"email" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_telepon" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_pemegang_saham
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_pemegang_saham" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_pemegang_saham" BIGINT NULL DEFAULT NULL,
	"pemegang_saham" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"persentase_saham" FLOAT NULL DEFAULT NULL,
	"pemegang_saham_perusahaan_id" INT NULL DEFAULT NULL,
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_produk
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_produk" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_produk_perusahaan" BIGINT NULL DEFAULT NULL,
	"kbki" VARCHAR(10) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"produk" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_telepon
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_telepon" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_telepon_perusahaan" BIGINT NULL DEFAULT NULL,
	"nomor_ekstensi" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_telepon" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_assessment_results_web
CREATE TABLE IF NOT EXISTS "matcha_assessment_results_web" (
	"id" BIGINT NOT NULL,
	"id_alokasi" INT NOT NULL,
	"id_website_perusahaan" BIGINT NULL DEFAULT NULL,
	"website" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"perusahaan_id" BIGINT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_data_spool
CREATE TABLE IF NOT EXISTS "matcha_data_spool" (
	"id_spool" BIGINT NOT NULL,
	"id_kegiatan" INT NOT NULL,
	"idsbr" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"sumber_data" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"negara" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"provinsi" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kabupaten_kota" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kecamatan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kelurahan_desa" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_perusahaan" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_komersial_perusahaan" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"alamat" VARCHAR(max) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_kode_area" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kode_pos" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kodese" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"latitude" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"longitude" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"blok_sensus" BIGINT NULL DEFAULT 'NULL',
	"email_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_faksimili" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_ekstensi" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_telepon" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"website" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"email_kontak_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_kontak_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_telepon_kontak_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"tahun_beroperasi" INT NULL DEFAULT 'NULL',
	"tahun_pendirian" INT NULL DEFAULT 'NULL',
	"multi_national_status" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"skala_usaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jam_buka" DATETIME2(7) NULL DEFAULT 'NULL',
	"jam_tutup" DATETIME2(7) NULL DEFAULT 'NULL',
	"jumlah_kamar" INT NULL DEFAULT 'NULL',
	"aset" FLOAT NULL DEFAULT 'NULL',
	"npwp" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pajak_tahun_pendaftarannpwp" INT NULL DEFAULT 'NULL',
	"pajak_tahunspt" INT NULL DEFAULT 'NULL',
	"pajak_tanggal_update" DATETIME2(7) NULL DEFAULT 'NULL',
	"pendapatan_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"pengeluaran_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"pajak_jeniswp" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pajak_skala_usaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pajak_statuswp" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pemegang_saham" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"presentase_saham" FLOAT NULL DEFAULT NULL,
	"aktivitas_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kategori_aktivitas" VARCHAR(1) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kbli_aktivitas" VARCHAR(5) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kbki_produk_perusahaan" VARCHAR(10) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"produk_perusahaan" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_pengusaha_pemilik" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"tanggal_lahir_pengusaha" DATETIME2(7) NULL DEFAULT 'NULL',
	"jenis_kelamin_pengusaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status_kepemilikan" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kewarganegaraan_pengusaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kbji_pengusaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jaringan_usaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jenis_badan_hukum_badan_usaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"sektor_institusi" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"statusbumn" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status_perusahaan" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"tahun_ref_aset" INT NULL DEFAULT 'NULL',
	"tahun_ref_kompensasi_asing" INT NULL DEFAULT 'NULL',
	"tahun_ref_kompensasi_lokal" INT NULL DEFAULT 'NULL',
	"tahun_ref_pendapatan" INT NULL DEFAULT 'NULL',
	"tahun_ref_pengeluaran" INT NULL DEFAULT 'NULL',
	"tahun_ref_skala_usaha" INT NULL DEFAULT 'NULL',
	"tahun_ref_tenaga_kerja_asing" INT NULL DEFAULT 'NULL',
	"tahun_ref_tenaga_kerja_lokal" INT NULL DEFAULT 'NULL',
	"total_kompensasi_asing_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"total_kompensasi_lokal_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"total_tenaga_kerja_asing_per_tahun" INT NULL DEFAULT 'NULL',
	"total_tenaga_kerja_lokal_per_tahun" INT NULL DEFAULT 'NULL',
	"unit_statistik" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id_spool")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_kegiatan
CREATE TABLE IF NOT EXISTS "matcha_kegiatan" (
	"id_kegiatan" INT NOT NULL,
	"name" VARCHAR(255) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"description" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"matching_active" BIT NULL DEFAULT NULL,
	"assessment_active" BIT NULL DEFAULT NULL,
	"created_at" DATETIME NULL DEFAULT NULL,
	"updated_at" DATETIME NULL DEFAULT NULL,
	PRIMARY KEY ("id_kegiatan")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_master_sbr_temp
CREATE TABLE IF NOT EXISTS "matcha_master_sbr_temp" (
	"id" BIGINT NOT NULL,
	"alamat" VARCHAR(max) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"aset" FLOAT NULL DEFAULT 'NULL',
	"catatan" VARCHAR(max) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jam_buka" DATETIME2(7) NULL DEFAULT 'NULL',
	"jam_tutup" DATETIME2(7) NULL DEFAULT 'NULL',
	"jenis_kelamin_pengusaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"jumlah_kamar" INT NULL DEFAULT 'NULL',
	"kode" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kode_pos" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kodese" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"latitude" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"longitude" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"multi_national_status" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nama_komersial" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nomor_kode_area" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"npwp" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"pajak_tahun_pendaftarannpwp" INT NULL DEFAULT 'NULL',
	"pajak_tahunspt" INT NULL DEFAULT 'NULL',
	"pajak_tanggal_update" DATETIME2(7) NULL DEFAULT 'NULL',
	"pendapatan_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"pengeluaran_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"pengusaha_pemilik" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"skala_usaha" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"status_kepemilikan" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"tahun_beroperasi" INT NULL DEFAULT 'NULL',
	"tahun_pendirian" INT NULL DEFAULT 'NULL',
	"tahun_ref_aset" INT NULL DEFAULT 'NULL',
	"tahun_ref_kompensasi_asing" INT NULL DEFAULT 'NULL',
	"tahun_ref_kompensasi_lokal" INT NULL DEFAULT 'NULL',
	"tahun_ref_pendapatan" INT NULL DEFAULT 'NULL',
	"tahun_ref_pengeluaran" INT NULL DEFAULT 'NULL',
	"tahun_ref_skala_usaha" INT NULL DEFAULT 'NULL',
	"tahun_ref_tenaga_kerja_asing" INT NULL DEFAULT 'NULL',
	"tahun_ref_tenaga_kerja_lokal" INT NULL DEFAULT 'NULL',
	"tanggal_lahir_pengusaha" DATETIME2(7) NULL DEFAULT 'NULL',
	"total_kompensasi_asing_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"total_kompensasi_lokal_per_tahun" FLOAT NULL DEFAULT 'NULL',
	"total_tenaga_kerja_asing_per_tahun" INT NULL DEFAULT 'NULL',
	"total_tenaga_kerja_lokal_per_tahun" INT NULL DEFAULT 'NULL',
	"unit_statistik" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"blok_sensus_id" BIGINT NULL DEFAULT 'NULL',
	"induk_id" BIGINT NULL DEFAULT 'NULL',
	"infrastruktur_id" BIGINT NULL DEFAULT 'NULL',
	"jaringan_usaha_id" BIGINT NULL DEFAULT 'NULL',
	"jenis_badan_hukum_badan_usaha_id" BIGINT NULL DEFAULT 'NULL',
	"kabupaten_kota_id" BIGINT NULL DEFAULT 'NULL',
	"kbji_pengusaha_id" BIGINT NULL DEFAULT 'NULL',
	"kecamatan_id" BIGINT NULL DEFAULT 'NULL',
	"kelurahan_desa_id" BIGINT NULL DEFAULT 'NULL',
	"kewarganegaraan_pengusaha_id" BIGINT NULL DEFAULT 'NULL',
	"metode_enumerasi_pilihan_id" BIGINT NULL DEFAULT 'NULL',
	"negara_id" BIGINT NULL DEFAULT 'NULL',
	"pajak_jeniswp_id" BIGINT NULL DEFAULT 'NULL',
	"pajak_skala_usaha_id" BIGINT NULL DEFAULT 'NULL',
	"pajak_statuswp_id" BIGINT NULL DEFAULT 'NULL',
	"provinsi_id" BIGINT NULL DEFAULT 'NULL',
	"sektor_institusi_id" BIGINT NULL DEFAULT 'NULL',
	"sls_id" BIGINT NULL DEFAULT 'NULL',
	"statusbumn_id" BIGINT NULL DEFAULT 'NULL',
	"status_perusahaan_id" BIGINT NULL DEFAULT 'NULL',
	"subject_matter_custodian_id" BIGINT NULL DEFAULT 'NULL',
	"locked" VARCHAR(255) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_matching_results
CREATE TABLE IF NOT EXISTS "matcha_matching_results" (
	"id" BIGINT NOT NULL,
	"id_spool" INT NOT NULL,
	"idsbr" INT NOT NULL,
	"id_kegiatan" INT NOT NULL,
	"is_newsbr" BIT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

-- Dumping structure for table sbrdb-dev.matcha_users
CREATE TABLE IF NOT EXISTS "matcha_users" (
	"id" BIGINT NOT NULL,
	"username" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"password" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"name" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"email" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nip" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"photo" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"role" VARCHAR(255) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id")
);

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
