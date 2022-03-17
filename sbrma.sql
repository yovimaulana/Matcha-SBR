create table kegiatan (

    id_kegiatan int identity(1,1) primary key,
    name varchar(255) not null,
    description varchar(255) null,
    matching_active bit null,
    assessment_active bit null,
    created_at datetime null,
    updated_at datetime null    

);


create table data_spool (

    id_spool int identity(1,1) primary key,
    id_kegiatan int not null,
    idsbr varchar(255) null,
    sumber_data varchar(255) null,
    "negara" varchar(255) NULL, -- table business_perusahaan: negara_id --
    "provinsi" varchar(255) NULL, -- table business_perusahaan: provinsi_id --    
	"kabupaten_kota" varchar(255) NULL, -- table business_perusahaan: kabupaten_kota_id --
    "kecamatan" varchar(255) NULL, -- table business_perusahaan: kecamatan_id --
	"kelurahan_desa" varchar(255) NULL, -- table business_perusahaan : kelurahan_desa_id --
    "nama_perusahaan" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan : nama --
	"nama_komersial_perusahaan" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan : nama_komersial --    
    "alamat" VARCHAR(max) NULL DEFAULT NULL , -- table business_perusahaan --
    "nomor_kode_area" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"kode_pos" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"kodese" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"latitude" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"longitude" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
    "blok_sensus" BIGINT NULL DEFAULT NULL, -- table business_perusahaan:  blok_sensus_id --		
    "sls" BIGINT NULL DEFAULT NULL, -- table business_perusahaan : sls_id --
    "email_perusahaan" varchar(255) null, -- tabel business_alamat_email_perusahaan : email --
    "nomor_faksimili" varchar(255) null, -- tabel business_alamat_fax_perusahaan --    
    "nomor_ekstensi" varchar(255) null, -- tabel business_alamat_telepon_perusahaan --
    "nomor_telepon" varchar(255) null, -- tabel business_alamat_telepon_perusahaan --
    "website" varchar(255) null, -- tabel business_alamat_web_perusahaan --
    "email_kontak_perusahaan" varchar(255) null, -- tabel business_kontak_perusahaan : email --
    "nama_kontak_perusahaan" varchar(255) null, -- tabel business_kontak_perusahaan : nama --
    "nomor_telepon_kontak_perusahaan" varchar(255) null, -- tabel business_kontak_perusahaan : nomor_telepon --
	"tahun_beroperasi" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_pendirian" INT NULL DEFAULT NULL, -- table business_perusahaan --
    "multi_national_status" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
    "skala_usaha" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --	
    "jam_buka" DATETIME2(7) NULL DEFAULT NULL, -- table business_perusahaan --
	"jam_tutup" DATETIME2(7) NULL DEFAULT NULL, -- table business_perusahaan --
    "jumlah_kamar" INT NULL DEFAULT NULL, -- table business_perusahaan --
    "aset" FLOAT NULL DEFAULT NULL,	-- table business_perusahaan --	
	"npwp" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"pajak_tahun_pendaftarannpwp" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"pajak_tahunspt" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"pajak_tanggal_update" DATETIME2(7) NULL DEFAULT NULL, -- table business_perusahaan --
	"pendapatan_per_tahun" FLOAT NULL DEFAULT NULL, -- table business_perusahaan --
	"pengeluaran_per_tahun" FLOAT NULL DEFAULT NULL, -- table business_perusahaan --
    "pajak_jeniswp" BIGINT NULL DEFAULT NULL, -- table business_perusahaan : pajak_jeniswp_id --
	"pajak_skala_usaha" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: pajak_skala_usaha_id --
	"pajak_statuswp" BIGINT NULL DEFAULT NULL, -- table business_perusahaan : pajak_statuswp_id --
    "pemegang_saham" varchar(255) null, -- tabel business_pemegang_saham --
    "presentase_saham" FLOAT null, -- tabel business_pemegang_saham --
    "aktivitas_perusahaan" varchar(255) null, -- tabel business_aktivitas_perusahaan: aktivitas --
    "kategori_aktivitas" varchar(1) null, -- tabel business_aktivitas_perusahaan: kategori --
    "kbli_aktivitas" varchar(5) null, -- tabel business_aktivitas_perusahaan: kbli --
    "kbki_produk_perusahaan" varchar(10) null, -- tabel business_produk_perusahaan : kbki --
    "produk_perusahaan" varchar(255) null, -- tabel business_produk_perusahaan : produk --    
    "nama_pengusaha_pemilik" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan : pengusaha_pemilik --
    "tanggal_lahir_pengusaha" DATETIME2(7) NULL DEFAULT NULL, -- table business_perusahaan --
	"jenis_kelamin_pengusaha" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
    "status_kepemilikan" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --
	"kewarganegaraan_pengusaha" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: kewarganegaraan_pengusaha_id --
    "kbji_pengusaha" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: kbji_pengusaha_id --
	"jaringan_usaha" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: jaringan_usaha_id --
	"jenis_badan_hukum_badan_usaha" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: jenis_badan_hukum_badan_usaha_id --
	"sektor_institusi" BIGINT NULL DEFAULT NULL, -- table business_perusahaan : sektor_institusi_id --
    "statusbumn" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: statusbumn_id --
	"status_perusahaan" BIGINT NULL DEFAULT NULL, -- table business_perusahaan : status_perusahaan_id --
	"subject_matter_custodian" BIGINT NULL DEFAULT NULL, -- table business_perusahaan: subject_matter_custodian_id --	
    "tahun_ref_aset" INT NULL DEFAULT NULL,  -- table business_perusahaan --
	"tahun_ref_kompensasi_asing" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_kompensasi_lokal" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_pendapatan" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_pengeluaran" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_skala_usaha" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_tenaga_kerja_asing" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"tahun_ref_tenaga_kerja_lokal" INT NULL DEFAULT NULL, -- table business_perusahaan --	
	"total_kompensasi_asing_per_tahun" FLOAT NULL DEFAULT NULL, -- table business_perusahaan --
	"total_kompensasi_lokal_per_tahun" FLOAT NULL DEFAULT NULL, -- table business_perusahaan --
	"total_tenaga_kerja_asing_per_tahun" INT NULL DEFAULT NULL, -- table business_perusahaan --
	"total_tenaga_kerja_lokal_per_tahun" INT NULL DEFAULT NULL, -- table business_perusahaan --
    "unit_statistik" VARCHAR(255) NULL DEFAULT NULL , -- table business_perusahaan --


    -- belum beres masih harus ditambah kolom yang ada di tabel: --
    /*
    1. business_perusahaan_export -> ga dipake
    2. business_perusahaan_hubungan_khusus -> ga dipake
    3. business_perusahaan_sumber_map -> ga dipake    
    16. business_ref_status_perusahaan -> ga dipake

    4. business_pemegang_saham (v)
    5. business_aktivitas_perusahaan (v)
    6. business_alamat_email_perusahaan (v)
    7. business_alamat_fax_perusahaan (v)
    9. business_alamat_telepon_perusahaan (v)
    10. business_alamat_web_perusahaan (v)
    11. business_kontak_perusahaan (v)
    15. business_produk_perusahaan (v)

    8. business_alamat_perusahaan -> ragu
    */

);


create table master_sbr_temp (

    "id" BIGINT NOT NULL,
    "alamat" VARCHAR(max) NULL DEFAULT NULL ,
	"aset" FLOAT NULL DEFAULT NULL,
	"catatan" VARCHAR(max) NULL DEFAULT NULL ,
	"jam_buka" DATETIME2(7) NULL DEFAULT NULL,
	"jam_tutup" DATETIME2(7) NULL DEFAULT NULL,
	"jenis_kelamin_pengusaha" VARCHAR(255) NULL DEFAULT NULL ,
	"jumlah_kamar" INT NULL DEFAULT NULL,
	"kode" VARCHAR(255) NULL DEFAULT NULL ,
	"kode_pos" VARCHAR(255) NULL DEFAULT NULL ,
	"kodese" VARCHAR(255) NULL DEFAULT NULL ,
	"latitude" VARCHAR(255) NULL DEFAULT NULL ,
	"longitude" VARCHAR(255) NULL DEFAULT NULL ,
	"multi_national_status" VARCHAR(255) NULL DEFAULT NULL ,
	"nama" VARCHAR(255) NULL DEFAULT NULL ,
	"nama_komersial" VARCHAR(255) NULL DEFAULT NULL ,
	"nomor_kode_area" VARCHAR(255) NULL DEFAULT NULL ,
	"npwp" VARCHAR(255) NULL DEFAULT NULL ,
	"pajak_tahun_pendaftarannpwp" INT NULL DEFAULT NULL,
	"pajak_tahunspt" INT NULL DEFAULT NULL,
	"pajak_tanggal_update" DATETIME2(7) NULL DEFAULT NULL,
	"pendapatan_per_tahun" FLOAT NULL DEFAULT NULL,
	"pengeluaran_per_tahun" FLOAT NULL DEFAULT NULL,
	"pengusaha_pemilik" VARCHAR(255) NULL DEFAULT NULL ,
	"skala_usaha" VARCHAR(255) NULL DEFAULT NULL ,
	"status_kepemilikan" VARCHAR(255) NULL DEFAULT NULL ,
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
	"unit_statistik" VARCHAR(255) NULL DEFAULT NULL ,
	"blok_sensus_id" BIGINT NULL DEFAULT NULL,
	"induk_id" BIGINT NULL DEFAULT NULL,
	"infrastruktur_id" BIGINT NULL DEFAULT NULL,
	"jaringan_usaha_id" BIGINT NULL DEFAULT NULL,
	"jenis_badan_hukum_badan_usaha_id" BIGINT NULL DEFAULT NULL,
	"kabupaten_kota_id" BIGINT NULL DEFAULT NULL,
	"kbji_pengusaha_id" BIGINT NULL DEFAULT NULL,
	"kecamatan_id" BIGINT NULL DEFAULT NULL,
	"kelurahan_desa_id" BIGINT NULL DEFAULT NULL,
	"kewarganegaraan_pengusaha_id" BIGINT NULL DEFAULT NULL,
	"metode_enumerasi_pilihan_id" BIGINT NULL DEFAULT NULL,
	"negara_id" BIGINT NULL DEFAULT NULL,
	"pajak_jeniswp_id" BIGINT NULL DEFAULT NULL,
	"pajak_skala_usaha_id" BIGINT NULL DEFAULT NULL,
	"pajak_statuswp_id" BIGINT NULL DEFAULT NULL,
	"provinsi_id" BIGINT NULL DEFAULT NULL,
	"sektor_institusi_id" BIGINT NULL DEFAULT NULL,
	"sls_id" BIGINT NULL DEFAULT NULL,
	"statusbumn_id" BIGINT NULL DEFAULT NULL,
	"status_perusahaan_id" BIGINT NULL DEFAULT NULL,
	"subject_matter_custodian_id" BIGINT NULL DEFAULT NULL,
    "locked" VARCHAR(255) NULL DEFAULT NULL

);


create table users (

    id int identity(1,1) primary key,
    username varchar(255) null,
    password varchar(255) null,
    name varchar(255) null,
    email varchar(255) null,
    nip varchar(255) null,
    photo varchar(255) null,
    role varchar(255) null

);

create table alokasi_petugas_matching (

    id bigint identity(1,1) primary key,
    id_user int null,
    id_kegiatan int not null,
    id_spool int not null,
    is_matching bit null,
    islocked datetime null

);

create table matching_results (
    id int identity(1,1) primary key,
    id_spool int not null,
    idsbr int not null,
    id_kegiatan int not null,
    is_newsbr bit null
);

create table alokasi_petugas_assessment (

    id int identity(1,1) primary key,
    id_user int null,
    id_kegiatan int not null,
    idsbr int not null,
    is_assessment bit null,    

);


create table assessment_results (

    id int identity(1,1) primary key,
    id_alokasi int not null,
    idsbr int null,
    id_perusahaan int null,
    negara_id int null,
    provinsi_id int null,
    kabupaten_kota_id int null,
    kecamatan_id int null,
    kelurahan_desa_id int null,
    jenis_badan_hukum_badan_usaha_id int null,
    nama varchar(255) null,
    nama_komersial varchar(255) null,
    alamat varchar(max) null, 
    nomor_kode_area varchar(255) null, 
    kode_pos varchar(255) null,
    kodese varchar(255) null, 
    latitude varchar(255) null, 
    longitude varchar(255) null,
    tahun_beroperasi int null, 
    tahun_pendirian int null, 
    multi_national_status varchar(255) null,
    skala_usaha varchar(255) null, 
    jam_buka DATETIME2(7) null, 
    jam_tutup DATETIME2(7) null, 
    jumlah_kamar int null,
    aset float null, 
    npwp varchar(255) null, 
    pajak_tahun_pendaftarannpwp int null, 
    pajak_tahunspt int null,
    pajak_tanggal_update datetime2(7) null, 
    pendapatan_per_tahun float null, 
    pengeluaran_per_tahun float null,
    pengusaha_pemilik varchar(255) null, 
    tanggal_lahir_pengusaha datetime2(7) null, 
    jenis_kelamin_pengusaha varchar(255) null,
    status_kepemilikan varchar(255) null, 
    tahun_ref_aset int null, 
    tahun_ref_kompensasi_asing int null, 
    tahun_ref_kompensasi_lokal int null, 
    tahun_ref_pendapatan int null, 
    tahun_ref_pengeluaran int null,
    tahun_ref_skala_usaha int null, 
    tahun_ref_tenaga_kerja_asing int null, 
    tahun_ref_tenaga_kerja_lokal int null,
    total_kompensasi_asing_per_tahun float null, 
    total_kompensasi_lokal_per_tahun float null, 
    total_tenaga_kerja_asing_per_tahun int null,
    total_tenaga_kerja_lokal_per_tahun int null, 
    unit_statistik varchar(255) null

);

create table assessment_results_email (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_email_perusahaan BIGINT null,
    email varchar(255) null,
    perusahaan_id BIGINT null
);

create table assessment_results_fax (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_fax_perusahaan BIGINT null,
    nomor_faksimili varchar(255) null,
    perusahaan_id BIGINT null
);

create table assessment_results_telepon (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_telepon_perusahaan BIGINT null,
    nomor_ekstensi varchar(255) null,
    nomor_telepon varchar(255) null,
    perusahaan_id BIGINT null
);

create table assessment_results_web (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_website_perusahaan BIGINT null,
    website varchar(255) null,    
    perusahaan_id BIGINT null
);

create table assessment_results_kontak_perusahaan (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_kontak_perusahaan BIGINT null,
    email varchar(255) null,
    nama varchar(255) null,
    nomor_telepon varchar(255) null, 
    perusahaan_id BIGINT null
);

create table assessment_results_pemegang_saham (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_pemegang_saham BIGINT null,
    pemegang_saham varchar(255) null,    
    presentase_saham float null,    
    perusahaan_id BIGINT null
);

create table assessment_results_aktivitas (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_aktivitas_perusahaan BIGINT null,
    aktivitas varchar(255) null,    
    jenis varchar(255) null,    
    kategori varchar(1) null,
    kbli varchar(5) null,
    perusahaan_id BIGINT null
);

create table assessment_results_produk (
    id int identity(1,1) primary key,
    id_alokasi int not null,
    id_produk_perusahaan BIGINT null,
    kbki varchar(10) null,    
    produk varchar(255) null,
    perusahaan_id BIGINT null
);
