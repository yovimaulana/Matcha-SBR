```sql

1. GET api/users
    
    -- description: mendapatkan seluruh user yang memiliki role = USER

    select * from users where role = {{USER}}

    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data users berhasil diambil'
        },
        'data': {
            [
                {
                    'id': ...,
                    'username': ...,
                    'password': ...,
                    'name': ...,
                    'email': ...,
                    'nip': ...,
                    'photo': ...,
                    'role': ...
                },
                {
                    'id': ...,
                    'username': ...,
                    'password': ...,
                    'name': ...,
                    'email': ...,
                    'nip': ...,
                    'photo': ...,
                    'role': ...
                },
                ... dst
            ]
        }
    }

2. GET api/kegiatan?type={{jenis_kegiatan}}&status={{active}}

    -- description: mendapatkan daftar kegiatan berdasarkan tipe dan status nya

    -- nilai dari variabel {{jenis_kegiatan}} = matching / assessment
    -- nilai dari variabel {{active}} = active / inactive

    -- jika {{ jenis_kegiatan }} =  matching
    -- get seluruh kegiatan matching yang status nya masih aktif
    select * from kegiatan where matching_active = 1

    -- jika {{ jenis_kegiatan }} =  matching
    -- get seluruh kegiatan matching yang status nya tidak aktif
    select * from kegiatan where matching_active is null or matching_active = 0

    -- jika {{ jenis_kegiatan }} =  assessment
    -- get seluruh kegiatan assessment yang status nya masih aktif
    select * from kegiatan where assessment_active = 1

    -- jika {{ jenis_kegiatan }} =  assessment
    -- get seluruh kegiatan assessment yang status nya tidak aktif
    select * from kegiatan where assessment_active is null or matching_active = 0

    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data users berhasil diambil'
        },
        'data': {
            [
                {
                    'id_kegiatan': ...,
                    'name': ...,
                    'description': ...,
                    'matching_active': ...,
                    'assessment_active': ...,
                    'created_at': ...,
                    'updated_at': ...
                },
                {
                    'id_kegiatan': ...,
                    'name': ...,
                    'description': ...,
                    'matching_active': ...,
                    'assessment_active': ...,
                    'created_at': ...,
                    'updated_at': ...
                },
                ... dst
            ]
        }
    }

3. POST api/kegiatan

    -- action: input data kegiatan baru ke tabel kegiatan    
    -- variabel yang dibutuhkan: name, description
    -- matching_active dan assessment_active default value nya = null untuk input kegiatan baru
    -- input yang diterima backend:
    {
        'name': 'Kegiatan Baru',
        'description': 'Lorem ipsum dolor amet ....'
    }

    insert into kegiatan (name, description, created_at) values ( {{name}}, {{description}}, getdate() )

    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil memasukan kegiatan baru'
        },
        'data': {
            'id_kegiatan': 20,
            'name': 'Kegiatan Baru'
            'description': 'Lorem ipsum dolor amet ....',
            'matching_active': null,
            'assessment_active': null,
            'created_at': '2021-06-31 15:30:12',
            'updated_at': null
        }
    }

4. POST api/kegiatan/{{id_kegiatan}}/update

    -- action: update data kegiatan
    -- variabel yang dibutuhkan: id_kegiatan, name, description, matching_active, assessment_active
    -- rule validasi:
        -- range nilai kolom matching_active dan assessment_active -> [null, 1, 0]    
            -- null : kegiatan matching / assessment belum dimulai
            -- 1 : kegiatan matching / assessment sedang dilaksanakan (aktif)
            -- 0 : kegiatan matching / assessment sudah selesai
        -- berikut rincian rule validasi:
            -- jika, matching_active = null atau 1 -> maka assessment_active harus langsung di set dibackend = null
            -- matching_active = 0 hanya jika semua data spool sudah dimatching, cara cek nya:
                select count(*) matching_belum_selesai from alokasi_petugas_matching where (is_matching is NULL or is_matching = 0) and id_kegiatan = {{id_kegiatan}}
            -- jika nilai matching_belum_selesai nya > 0 return error
            -- jika, assessment_active = 1 -> maka matching_active harus = 0
            -- assessment_active = 0 hanya jika matching_active = 0 & semua data assessment sudah diassess semua, cara ceknya:
                select count(*) assessment_belum_selesai from alokasi_petugas_assessment where (is_assessment is NULL or is_assessment = 0) and id_kegiatan = {{id_kegiatan}}
            -- jika matching_active = 0 & assessment_belum_selesai = 0 -> return sukses else return gagal/error

    -- input yang diterima backend:
    {
        'id_kegiatan': '5'
        'name': 'Edit Kegiatan ABCD',
        'description': 'Lorem ipsum ...',        
        'matching_active': null / 1 / 0,
        'assessment_active': null / 1 / 0
    }

    update kegiatan set name = {{name}}, description = {{description}}, matching_active = {{matching_active}}, assessment_active = {{assessment_active}} 
    where id_kegiatan = {{id_kegiatan}}

    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil update kegiatan'
        },
        'data': {
            'id_kegiatan': 5,
            'name': 'Edit Kegiatan ABCD',
            'description': 'Lorem ipsum ...', 
            'matching_active': null / 1 /0,
            'assessment_active': null / 1 /0,
            'created_at': '2021-06-31 15:30:12',
            'updated_at': null
        }
    }



5. GET api/kegiatan/{{id_kegiatan}}/matching/alokasi

    -- description: mendapatkan daftar alokasi petugas matching

    -- cek apakah semua data untuk matching di data_spool sudah dimasukan semua ke tabel alokasi_petugas_matching
    select count(*) spool_belum_dimasukan from data_spool 
    left join alokasi_petugas_matching on alokasi_petugas_matching.id_kegiatan = data_spool.id_kegiatan
    where alokasi_petugas_matching.id_kegiatan is null and data_spool.id_kegiatan = {{id_kegiatan}}

    -- kalau hasil cek di atas ternyata menghasilkan spool_belum_dimasukan > 0, lakukan insert data spool yang belum ada di tabel alokasi_petugas_matching:
    insert into alokasi_petugas_matching (id_spool, id_kegiatan, id_user, islocked, is_matching)
    select data_spool.id_spool, data_spool.id_kegiatan, alokasi_petugas_matching.id_user, alokasi_petugas_matching.islocked, alokasi_petugas_matching.is_matching from data_spool 
    left join alokasi_petugas_matching on alokasi_petugas_matching.id_kegiatan = data_spool.id_kegiatan
    where alokasi_petugas_matching.id_kegiatan is null and data_spool.id_kegiatan = {{id_kegiatan}}

    -- get alokasi petugas matching yang sudah pernah diset -> data['alokasi'] : ...
    select id_user, users.name, count(*) jumlah_alokasi from alokasi_petugas_matching 
    left join users on users.id = alokasi_petugas_matching.id_user
    where id_kegiatan = {{id_kegiatan}} and alokasi_petugas_matching.id_user is not null
    group by (id_user, name)

    -- get summary alokasi petugas matching -> data['summary']: ....
    select id_kegiatan, count(case id_user is not null then 1 end ) teralokasi, count(case id_user is null then 1 end) belum_teralokasi, count(*) total_data_matching 
    from alokasi_petugas_matching where id_kegiatan = {{id_kegiatan}} group by id_kegiatan


    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data berhasil diambil'
        },
        'data': {
            'summary': {
                'id_kegiatan': 1,
                'teralokasi': 100,
                'belum_teralokasi': 50,
                'total_data_matching': 150
            },
            'alokasi': [
                {
                    'id_user': 1,
                    'name': 'Ahmad',
                    'jumlah_alokasi': 20
                },
                {
                    'id_user': 10,
                    'name': 'Budi',
                    'jumlah_alokasi': 15
                },
                ... dst
            ]
        }
    }


6. POST api/kegiatan/{{id_kegiatan}}/matching/alokasi
    
    -- action: insert atau update alokasi petugas matching        
    -- variabel yang dibutuhkan: id_user, id_kegiatan, jumlah_alokasi
    -- input yang diterima backend: 
    {
        'id_kegiatan': 100,
        'alokasi': [
            {
                'id_user': 1,
                'jumlah_alokasi': 30
            },
            {
                'id_user': 15,
                'jumlah_alokasi': 70
            },
            ... dst
        ]
    }
    
    -- query alokasi petugas: di looping sesuai dengan jumlah object pada array alokasi
    MERGE INTO alokasi_petugas_matching T
    USING (
        select top {{jumlah_alokasi}} id_kegiatan from alokasi_petugas_matching where id_user is null and id_kegiatan = {{id_kegiatan}} order by newid()
    ) S 
        ON T.id_kegiatan = S.id_kegiatan
    WHEN MATCHED THEN
    UPDATE 
        SET T.id_user = {{id_user}}

    -- output api:

    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil melakukan alokasi petugas matching'
        },
        'data': null
    }    
    


7. GET api/kegiatan/{{id_kegiatan}}/matching?user={{id_user}}

    -- description: mendapatkan data untuk melakukan proses matching per user - per kegiatan

    -- output dari api jika masih terdapat data yang harus di matching:
    {  
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil mendapatkan data matching'
        },
        'data': {
            "summary": {
                'id_kegiatan': ...,
                'sudah_matching': 30,
                'belum_matching': 120,
                'total_data_matching': 150
            },
            "spool": {
                'id_alokasi': ...,
                'id_spool': ...,
                'nama_perusahaan': ...,
                'alamat': ...,
                'nomor_telepon': ...,
                'aktivitas_perusahaan': ...,
                'kbli_aktivitas': ...
                'provinsi': '63',
                'kabupaten_kota': '72',
                'kecamatan': '010',
                'kelurahan_desa': '002'            
            },
            "matching": [
                {
                    "idsbr": ...,
                    "nama_perusahaan": ...,
                    "nama_komersial": ...,
                    "alamat": ...,
                    "skor_matching": ...,
                    "kode_pos": ...,
                    "aktivitas_perusahaan": ...,
                    "kbli_aktivitas": ...,
                    "nomor_telepon": ...,
                    "provinsi_id": 1,
                    "nama_provinsi": 'Kalimantan Selatan',
                    'kode_provinsi': '63',
                    "kabupaten_kota_id": 2,
                    'nama_kabupaten_kota': 'Kotabaru',
                    'kode_kabupaten_kota': '02',
                    'kecamatan_id': 5,
                    'nama_kecamatan': 'Pulau Laut Utara',
                    'kode_kecamatan': '003',
                    'kelurahan_desa_id': 9,
                    'nama_kelurahan_desa': 'Sumber Sari',
                    'kode_kelurahan_desa': '020'
                },
                {
                    "idsbr": ...,
                    "nama_perusahaan": ...,
                    "nama_komersial": ...,
                    "alamat": ...,
                    "skor_matching": ...,
                    "kode_pos": ...,
                    "aktivitas_perusahaan": ...,
                    ....
                },
                .... s.d 25 buah

            ]
        }
    }

    -- output dari api jika data yang harus dimatch sudah habis:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data matching sudah habis'
        },
        'data': {
            "summary": {
                'id_kegiatan': ...,
                'sudah_matching': 30,
                'belum_matching': 120,
                'total_data_matching': 150
            },
            'spool': null,
            'matching': null
        }
    }

    -- get summary progres matching petugas
    select id_kegiatan, count(case is_matching is not null then 1 end ) sudah_matching, count(case is_matching is null then 1 end) belum_matching, count(*) total_data_matching 
    from alokasi_petugas_matching where id_kegiatan = {{id_kegiatan}} and id_user = {{id_user}} group by id_kegiatan

    -- get 1 data spool untuk matching
    select top 1 alokasi_petugas_matching.id id_alokasi, data_spool.id_spool, data_spool.nama_perusahaan, data_spool.alamat, data_spool.provinsi, data_spool.kabupaten_kota, 
    data_spool.kecamatan, data_spool.kelurahan_desa, data_spool.nomor_telepon, data_spool.aktivitas_perusahaan, data_spool.kbli_aktivitas
    from alokasi_petugas_matching 
    left join data_spool on data_spool.id_spool = alokasi_petugas_matching.id_spool    
    where islocked is null and id_user = {{id_user}} and id_kegiatan = {{id_kegiatan}} and (is_matching is null or is_matching = 0) 
    order by newid()

    -- kalo hasil dari query get data spool diatas jumlah row nya = 0 (semua data spool sudah dimatching) maka kueri dibawah ini tidak perlu dieksekusi

    -- update semua islocked nya jadi null
    update alokasi_petugas_matching set islocked = null where id_user = {{id_user}} and id_kegiatan = {{id_kegiatan}} and (is_matching is null or is_matching = 0)

    -- update islocked untuk id_spool terpilih
    -- variabel yang dibutuhkan: id_alokasi -> didapat dari hasil get 1 data spool
    update alokasi_petugas_matching set islocked = getdate() where id = {{id_alokasi}}

    -- query untuk dapatkan 25 matching teratas untuk dimatching manual dengan 1 data spool    
    DECLARE
    @nama nvarchar(250),   
    @alamat nvarchar(250),
	@provinsi char(2)

    SET @nama="{{ nama_perusahaan }}"
    SET	@alamat="{{ alamat }}"
    SET @provinsi="{{ provinsi }}"
    
    select top 25 * from
    (
        SELECT 
        LTRIM(RTRIM(kode)) as idsbr,
        LTRIM(RTRIM(nama)) as nama_perusahaan,
        LTRIM(RTRIM(nama_komersial)) as nama_komersial,
        LTRIM(RTRIM(alamat)) as alamat,                
        (
            (2.0*(CASE WHEN KEY_TBL.RANK IS NULL then 0 else KEY_TBL.RANK end)) +
            (1.9*(CASE WHEN KEY_TBL2.RANK IS NULL then 0 else KEY_TBL2.RANK end))
        ) as skor_matching,

        kode_pos,         
        business_alamat_telepon_perusahaan.nomor_telepon, 
        business_aktivitas_perusahaan.aktivitas aktivitas_perusahaan, 
        business_aktivitas_perusahaan.kbli kbli_aktivitas,

        provinsi_id
        case(area_provinsi.nama is null then "-" else area_provinsi.nama end) nama_provinsi,        
        case(area_provinsi.kode is null then "-" else area_provinsi.kode end) kode_provinsi,
        kabupaten_kota_id,
        case(area_kabupaten_kota.nama is null then "-" else area_kabupaten_kota.nama end) nama_kabupaten_kota,
        case(area_kabupaten_kota.kode is null then "-" else area_kabupaten_kota.kode end) kode_kabupaten_kota,
        kecamatan_id,
        case(area_kecamatan.nama is null then "-" else area_kecamatan.nama end) nama_kecamatan,
        case(area_kecamatan.kode is null then "-" else area_kecamatan.kode end) kode_kecamatan,
        kelurahan_desa_id,
        case(area_kelurahan_desa.nama is null then "-" else area_kelurahan_desa.nama end) nama_kelurahan_desa,
        case(area_kelurahan_desa.kode is null then "-" else area_kelurahan_desa.kode end) kode_kelurahan_desa


        FROM master_sbr_temp AS FT_TBL FULL OUTER JOIN
            FREETEXTTABLE ( master_sbr_temp, nama, @nama ) AS KEY_TBL
        ON FT_TBL.kode = KEY_TBL.[KEY]

        FULL OUTER JOIN
        FREETEXTTABLE ( master_sbr_temp, alamat, @alamat ) AS KEY_TBL2
        ON FT_TBL.kode = KEY_TBL2.[KEY]

        left join business_aktivitas_perusahaan on business_aktivitas_perusahaan.perusahaan_id = master_sbr_temp.id
        left join business_alamat_telepon_perusahaan on business_alamat_telepon_perusahaan.perusahaan_id = master_sbr_temp.id
        left join area_provinsi on area_provinsi.id = master_sbr_temp.provinsi_id
        left join area_kabupaten_kota on area_kabupaten_kota.id = master_sbr_temp.kabupaten_kota_id
        left join area_kecamatan on area_kecamatan.id = master_sbr_temp.kecamatan_id
        left join area_kelurahan_desa on area_kelurahan_desa.id = master_sbr_temp.kelurahan_desa_id

        where area_provinsi.kode=@provinsi
    ) as T
    order by T.c desc    
	

8. POST api/kegiatan/{{id_kegiatan}}/matching?action=skip

    -- action: skip matching
    -- variabel yang dibutuhkan: id_alokasi
    -- input yang diterima backend:
    {
        'id_alokasi': 12        
    }

    update alokasi_petugas_matching set islocked = null where id = {{id_alokasi}}

    -- return value dari api ini adalah data matching spool selanjutnya    
    -- panggil api nomor 7 (get data matching)
    -- output dari api sama persis dengan output api 7    

9. POST api/kegiatan/{{id_kegiatan}}/matching?action=process

    -- action: process matching
    -- variabel yang dibutuhkan: id_alokasi, id_spool, idsbr
    -- input yang diterima backed:

    {
        'id_kegiatan': 10,
        'id_alokasi': 12,
        'id_spool': 1,
        'idsbr': [99898, 112314, 123123] -- isian pada array idsbr harus unik tidak boleh duplikat   
    }

    if(idsbr.length == 0) { -- jika tidak ada yang match
        -- kalau array idsbr empty [] (tidak ada yg match), insert data ke tabel FRS
        -- get data spool 
        select * from data_spool where id_spool = {{id_spool}}

        -- transformasi kode wilayah dkk sesuai tabel frs
        -- variabel {{ ... }} didapat dari hasil query select * from data_spool where id_spool = {{id_spool}}
            negara_id => select id from business_ref_negara where kode = {{negara}}
            provinsi_id => select top 1 id from area_provinsi where kode = {{provinsi}} order by id desc
            kabupaten_kota_id => select id from area_kabupaten_kota where kode = {{kabupaten_kota}} and provinsi_id = {{provinsi_id}} -- {{provinsi_id}} didapat dari atas
            kecamatan_id => select id from area_kecamatan where kode = {{kecamatan}} and kabupaten_kota_id = {{kabupaten_kota_id}} -- {{kabupaten_kota_id}} didapat dari atas
            kelurahan_desa_id => select id from area_kelurahan_desa where kode = {{kelurahan_desa}} and kecamatan_id = {{kecamatan_id}} -- {{kecamatan_id}} didapat dari atas
            pajak_jeniswp_id => select id from business_ref_pajak_jenis_wp where kode = {{pajak_jeniswp}}
            pajak_skala_usaha_id => select id from business_ref_pajak_skala_usaha where kode = {{pajak_skala_usaha}}
            pajak_statuswp_id => select id from business_ref_pajak_status_wp where kode = {{pajak_statuswp}}            
            kbji_pengusaha_id => select id from business_ref_kbji where kode = {{kbji_pengusaha}}
            jaringan_usaha_id => select id from business_ref_jaringan_usaha where kode = {{jaringan_usaha}}
            jenis_badan_hukum_badan_usaha_id => select id from business_ref_jenis_bhbu where kode = {{jenis_badan_hukum_badan_usaha}}
            sektor_institusi_id => select id from business_ref_sektor_institusi where kode = {{sektor_institusi}}
        -- catatan yovi (abaikan): variable _id transformasi ini kayaknya nanti dieksekusi manual aja
            

        -- insert data perusahaan ke tabel business_perusahaan    
        -- kolom id, kode pada tabel business_perusahaan untuk data baru merupakan idsbr -> id = kode = idsbr
        new_idsbr = (select max(id) from business_perusahaan) + 1
        insert into business_perusahaan (
            id, kode,
            negara_id, provinsi_id, kabupaten_kota_id, kecamatan_id, kelurahan_desa_id, 
            nama, nama_komersial, alamat, nomor_kode_area, kode_pos, kodese, latitude, longitude,
            tahun_beroperasi, tahun_pendirian, multi_national_status, skala_usaha, jam_buka, jam_tutup,
            jumlah_kamar, aset, npwp, pajak_tahun_pendaftarannpwp, pajak_tahunspt, pajak_tanggal_update, pendapatan_per_tahun,
            pengeluaran_per_tahun, pajak_jeniswp_id, pajak_skala_usaha_id, pajak_statuswp_id, pengusaha_pemilik, tanggal_lahir_pengusaha,
            jenis_kelamin_pengusaha, status_kepemilikan, kbji_pengusaha_id, jaringan_usaha_id, jenis_badan_hukum_badan_usaha_id,
            sektor_institusi_id, tahun_ref_aset, tahun_ref_kompensasi_asing,
            tahun_ref_kompensasi_lokal, tahun_ref_pendapatan, tahun_ref_pengeluaran, tahun_ref_skala_usaha, tahun_ref_tenaga_kerja_asing, tahun_ref_tenaga_kerja_lokal,
            total_kompensasi_asing_per_tahun, total_kompensasi_lokal_per_tahun, total_tenaga_kerja_asing_per_tahun, total_tenaga_kerja_lokal_per_tahun, 
            unit_statistik
        ) values (
            {{new_idsbr}}, {{new_idsbr}}, {{provinsi_id}}, {{kabupaten_kota_id}} .... dst
        )

        -- insert ke tabel business_update_perusahaan juga
        id_update = (select max(id) from business_update_perusahaan) + 1
        insert into business_update_perusahaan (
            id, jenis_update, kode, rel_perusahaan_id, ... dst -- ngikutin kolom pada tabel ini
        ) values (
            {{ id_update }}, 'SBR_FIRST', {{new_idsbr}}, {{new_idsbr}}, ... dst -- ngikutin kolom pada tabel ini
        )

      

        -- jika nilai produk_perusahaan pada data_spool is not null -> insert datanya ke tabel business_produk_perusahaan
        -- variabel yang dibutuhkan:
            -- produk_perusahaan: didapat dari hasil query select data_spool
            -- kbki_produk_perusahaan: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_produk = (select max(id) from business_produk_perusahaan) + 1
        insert into business_produk_perusahaan (id, produk, kbki, perusahaan_id) values ( {{new_id_produk}}, {{produk_perusahaan}}, {{ kbki_produk_perusahaan }}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_produk_perusahaan
        -- insert ke table updatenya
        insert into business_update_produk_perusahaan (produk, kbki, perusahaan_id, rel_produk_id) values ( {{produk_perusahaan}}, {{kbki_produk_perusahaan}}, {{id_update}}, {{new_id_produk}} )




        -- jika nilai aktivitas_perusahaan pada data_spool is not null -> insert datanya ke tabel business_aktivitas_perusahaan
        -- variabel yang dibutuhkan:
            -- aktivitas_perusahaan: didapat dari hasil query select data_spool
            -- kategori_aktivitas: didapat dari hasil query select data_spool
            -- kbli_aktivitas: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_aktivitas = (select max(id) from business_aktivitas_perusahaan) + 1
        insert into business_aktivitas_perusahaan (id, aktivitas, kategori, kbli, perusahaan_id) values ( {{new_id_aktivitas}}, {{aktivitas_perusahaan}}, {{ kategori_aktivitas }}, {{ kbli_aktivitas }}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_aktivitas_perusahaan
        -- insert ke table updatenya
        insert into business_update_aktivitas_perusahaan (aktivitas, kategori, kbli, perusahaan_id, rel_aktivitas_id) 
        values ( {{aktivitas_perusahaan}}, {{ kategori_aktivitas }}, {{ kbli_aktivitas }}, {{id_update}}, {{new_id_aktivitas}} )




        -- jika nilai pemegang_saham pada data_spool is not null -> insert datanya ke tabel business_pemegang_saham
        -- variabel yang dibutuhkan:
            -- pemegang_saham: didapat dari hasil query select data_spool
            -- presentase_saham: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_pemegang_saham = (select max(id) from business_pemegang_saham) + 1
        insert into business_pemegang_saham (id, pemegang_saham, presentase_saham, perusahaan_id) values ( {{new_id_pemegang_saham}}, {{pemegang_saham}}, {{ presentase_saham }}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_pemegang_saham
        -- insert ke tabel updatenya
        insert into business_update_pemegang_saham (pemegang_saham, presentase_saham, perusahaan_id, rel_saham_id) 
        values ( {{pemegang_saham}}, {{ presentase_saham }}, {{id_update}}, {{new_id_pemegang_saham}} )





        -- jika nilai email_perusahaan pada data_spool is not null -> insert data email perusahaan ke tabel business_alamat_email_perusahaan
        -- variabel yang dibutuhkan:
            -- email_perusahaan: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_alamat_email = (select max(id) from business_alamat_email_perusahaan) + 1
        insert into business_alamat_email_perusahaan (id, email, perusahaan_id) values ( {{new_id_alamat_email}}, {{email_perusahaan}}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_alamat_email_perusahaan
        -- insert ke tabel updatenya
        insert into business_update_alamat_email_perusahaan (email, perusahaan_id, rel_email_id) 
        values ( {{email_perusahaan}}, {{id_update}}, {{new_id_alamat_email}} )





        -- jika nilai nomor_faksimili pada data_spool is not null -> insert data nomor_faksimili perusahaan ke tabel business_alamat_fax_perusahaan
        -- variabel yang dibutuhkan:
            -- nomor_faksimili: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_alamat_fax = (select max(id) from business_alamat_fax_perusahaan) + 1
        insert into business_alamat_fax_perusahaan (id, nomor_faksimili, perusahaan_id) values ( {{new_id_alamat_fax}}, {{nomor_faksimili}}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_alamat_fax_perusahaan
        -- insert ke tabel updatenya
        insert into business_update_alamat_fax_perusahaan (nomor_faksimili, perusahaan_id, rel_fax_id) 
        values ( {{nomor_faksimili}}, {{id_update}}, {{new_id_alamat_fax}} )





        -- jika nilai nomor_telepon pada data_spool is not null -> insert data nomor_telepon perusahaan ke tabel business_alamat_telepon_perusahaan
        -- variabel yang dibutuhkan:
            -- nomor_telepon: didapat dari hasil query select data_spool
            -- nomor_ekstensi: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_alamat_telepon = (select max(id) from business_alamat_telepon_perusahaan) + 1
        insert into business_alamat_telepon_perusahaan (id, nomor_ekstensi, nomor_telepon, perusahaan_id) values ( {{new_id_alamat_telepon}}, {{nomor_ekstensi}}, {{ nomor_telepon }}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_alamat_fax_perusahaan
        -- insert ke tabel updatenya
        insert into business_update_alamat_telepon_perusahaan (nomor_ekstensi, nomor_telepon, perusahaan_id, rel_telepon_id) 
        values ( {{nomor_ekstensi}}, {{ nomor_telepon }}, {{id_update}}, {{new_id_alamat_telepon}} )

    



        -- jika nilai website pada data_spool is not null -> insert data website perusahaan ke tabel business_alamat_web_perusahaan
        -- variabel yang dibutuhkan:
            -- website: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_alamat_web = (select max(id) from business_alamat_web_perusahaan) + 1
        insert into business_alamat_web_perusahaan (id, website, perusahaan_id) values ( {{new_id_alamat_web}}, {{website}}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_alamat_web_perusahaan
        -- insert ke tabel updatenya
        insert into business_update_alamat_web_perusahaan (website, perusahaan_id, rel_website_id) 
        values ( {{website}}, {{id_update}}, {{new_id_alamat_web}} )





        -- jika nilai email_kontak_perusahaan atau nama_kontak_perusahaan  atau nomor_telepon_kontak_perusahaan pada data_spool is not null -> insert datanya ke tabel business_kontak_perusahaan
        -- variabel yang dibutuhkan:
            -- email_kontak_perusahaan: didapat dari hasil query select data_spool
            -- nama_kontak_perusahaan: didapat dari hasil query select data_spool
            -- nomor_telepon_kontak_perusahaan: didapat dari hasil query select data_spool
            -- perusahaan_id: didapat dari id hasil insert ke tabel business_perusahaan = {{new_idsbr}}
        new_id_kontak = (select max(id) from business_kontak_perusahaan) + 1
        insert into business_kontak_perusahaan (id, email, nama, nomor_telepon, perusahaan_id) 
        values ( {{new_id_kontak}}, {{email_kontak_perusahaan}}, {{nama_kontak_perusahaan}}, {{nomor_telepon_kontak_perusahaan}}, {{new_idsbr}} )

        -- jika melakukan insert ke table business_kontak_perusahaan
        -- insert ke tabel updatenya
        insert into business_update_kontak_perusahaan (email, nama, nomor_telepon, perusahaan_id, rel_kontak_id) 
        values ( {{email_kontak_perusahaan}}, {{nama_kontak_perusahaan}}, {{nomor_telepon_kontak_perusahaan}}, {{id_update}}, {{new_id_kontak}} ) 

        

        --update status matching
        update alokasi_petugas_matching set islocked = getdate(), is_matching = 1 where id = {{id_alokasi}}

        -- insert hasil matching
        insert into matching_results (id_spool, idsbr, id_kegiatan, is_newsbr) values ( {{id_spool}}, {{new_idsbr}}, {{id_kegiatan}}, 1 )
        
    } else 
    {
        -- update status matching
        update alokasi_petugas_matching set islocked = getdate(), is_matching = 1 where id = {{id_alokasi}}

        -- untuk setiap data pada array idsbr dilakukan input/insert dgn query berikut:
        insert into matching_results (id_spool, idsbr, id_kegiatan) values ( {{id_spool}}, {{idsbr}}, {{id_kegiatan}} )
    }
    
    

    -- jika gagal melakukan insert data
    -- api akan me-return pesan gagal
    {
        'meta': {
            'code': 400,
            'status': 'error',
            'message': 'Terdapat kesalahan pada saat proses input data'
        },
        'data': {
            'err_message': '.... custom error message dari spring / aplikasi'
        }
    }

    -- jika berhasil melakukan insert data
    -- api akan me-return data matching spool selanjutnya
    -- panggil api nomor 7 (get data matching)
    -- output dari api sama persis dengan output api 7
    
10. GET api/kegiatan/{{id_kegiatan}}/assessment/alokasi
    -- description: mendapatkan daftar alokasi petugas assessment

    -- cek apakah semua data untuk matching assessment sudah dimasukan semua ke tabel alokasi_petugas_assessment
    select count(*) data_belum_dimasukan from (
        select distinct idsbr from (
            select idsbr from data_spool where id_kegiatan = {{id_kegiatan}} and idsbr is not null
            union
            select idsbr from matching_results where id_kegiatan = {{id_kegiatan}} and (is_newsbr is null or is_newsbr = 0)
        )
    ) a 
    left join alokasi_petugas_assessment on alokasi_petugas_assessment.idsbr = a.idsbr
    where alokasi_petugas_assessment.idsbr is null and alokasi_petugas_assessment.id_kegiatan = {{id_kegiatan}}


    -- kalau hasil cek di atas ternyata menghasilkan data_belum_dimasukan > 0, lakukan insert data yang belum ada di tabel alokasi_petugas_assessment:
    insert into alokasi_petugas_assessment (idsbr, id_kegiatan, id_user, is_assessment)
    select a.idsbr, alokasi_petugas_assessment.id_kegiatan, alokasi_petugas_assessment.id_user, alokasi_petugas_assessment.is_assessment from (
        select distinct idsbr from (
            select idsbr from data_spool where id_kegiatan = {{id_kegiatan}} and idsbr is not null
            union
            select idsbr from matching_results where id_kegiatan = {{id_kegiatan}} and (is_newsbr is null or is_newsbr = 0)
        )
    ) a 
    left join alokasi_petugas_assessment on alokasi_petugas_assessment.idsbr = a.idsbr
    where alokasi_petugas_assessment.idsbr is null and alokasi_petugas_assessment.id_kegiatan = {{id_kegiatan}}
    

    -- get alokasi petugas assessment yang sudah pernah diset -> data['alokasi'] : ...
    select id_user, users.name, count(*) jumlah_alokasi from alokasi_petugas_assessment 
    left join users on users.id = alokasi_petugas_assessment.id_user
    where id_kegiatan = {{id_kegiatan}} and alokasi_petugas_assessment.id_user is not null
    group by (id_user, name)

    -- get summary alokasi petugas assessment -> data['summary']: ....
    select id_kegiatan, count(case id_user is not null then 1 end ) teralokasi, count(case id_user is null then 1 end) belum_teralokasi, count(*) total_data_assessment 
    from alokasi_petugas_assessment where id_kegiatan = {{id_kegiatan}} group by id_kegiatan


    -- output api:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data berhasil diambil'
        },
        'data': {
            'summary': {
                'id_kegiatan': 1,
                'teralokasi': 100,
                'belum_teralokasi': 50,
                'total_data_assessment': 150
            },
            'alokasi': [
                {
                    'id_user': 1,
                    'name': 'Ahmad',
                    'jumlah_alokasi': 20
                },
                {
                    'id_user': 10,
                    'name': 'Budi',
                    'jumlah_alokasi': 15
                },
                ... dst
            ]
        }
    }

11. POST api/kegiatan/{{id_kegiatan}}/assessment/alokasi
    
    -- action: insert atau update alokasi petugas assessment        
    -- variabel yang dibutuhkan: id_user, id_kegiatan, jumlah_alokasi
    -- input yang diterima backend: 
    {
        'id_kegiatan': 100,
        'alokasi': [
            {
                'id_user': 1,
                'jumlah_alokasi': 30
            },
            {
                'id_user': 15,
                'jumlah_alokasi': 70
            },
            ... dst
        ]
    }
    
    -- query alokasi petugas: di looping sesuai dengan jumlah object pada array alokasi
    MERGE INTO alokasi_petugas_assessment T
    USING (
        select top {{jumlah_alokasi}} id_kegiatan from alokasi_petugas_assessment where id_user is null and id_kegiatan = {{id_kegiatan}} order by newid()
    ) S 
        ON T.id_kegiatan = S.id_kegiatan
    WHEN MATCHED THEN
    UPDATE 
        SET T.id_user = {{id_user}}

    -- output api:

    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil melakukan alokasi petugas assessment'
        },
        'data': null
    }

12. GET api/kegiatan/{{id_kegiatan}}/assessment?user={{id_user}}

    -- description: mendapatkan data untuk melakukan proses assessment per user - per kegiatan

    -- output dari api jika masih terdapat data yang harus di matching:
    {  
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Berhasil mendapatkan data assessment'
        },
        'data': {
            "summary": {
                'id_kegiatan': ...,
                'sudah_assessment': 30,
                'belum_assessment': 120,
                'total_data_assessment': 150
            },
            "data_sbr": {
                'id_alokasi': ...,
                'idsbr': ...,                
                'nama': ...,
                'nama_komersial': ...,
                'alamat' : ...,
                'email': [],
                'fax': [],
                'telepon': [],
                'web': [],
                'kontak_perusahaan': [],
                'pemegang_saham': [],
                'aktivitas': [],
                'produk': [],
                .... dst
            },
            "assessment": [
                {
                    'id_spool': ...,
                    'id_kegiatan': ...,
                    'idsbr': ...,
                    'sumber_data': ...,
                    .... sd 76 kolom di tabel data_spool
                },
                {
                    'id_spool': ...,
                    'id_kegiatan': ...,
                    'idsbr': ...,
                    'sumber_data': ...,
                    .... sd 76 kolom di tabel data_spool
                },
                ... dst nya
            ]
        }
    }

    -- output dari api jika data yang harus dimatch sudah habis:
    {
        'meta': {
            'code': 200,
            'status': 'success',
            'message': 'Data matching sudah habis'
        },
        'data': {
            "summary": {
                'id_kegiatan': ...,
                'sudah_assessment': 30,
                'belum_assessment': 120,
                'total_data_assessment': 150
            },
            'data_sbr': null,
            'assessment': null
        }
    }

    -- get summary progres assessment petugas
    select id_kegiatan, count(case is_assessment is not null then 1 end ) sudah_assessment, count(case is_assessment is null then 1 end) belum_assessment, count(*) total_data_assessment 
    from alokasi_petugas_assessment where id_kegiatan = {{id_kegiatan}} and id_user = {{id_user}} group by id_kegiatan

    -- get 1 data sbr untuk assessment
    select top 1 alokasi_petugas_assessment.id id_alokasi, alokasi_petugas_assessment.idsbr, business_perusahaan.id id_perusahaan,
    business_ref_negara.nama nama_negara, business_ref_negara.kode kode_negara, business_ref_negara.id negara_id,
    area_provinsi.nama nama_provinsi, area_provinsi.kode kode_provinsi, area_provinsi.id provinsi_id,
    area_kabupaten_kota.nama nama_kabupaten_kota, area_kabupaten_kota.kode kode_kabupaten_kota, area_kabupaten_kota.id kabupaten_kota_id,
    area_kecamatan.nama nama_kecamatan, area_kecamatan.kode kode_kecamatan, area_kecamatan.id kecamatan_id,
    area_kelurahan_desa.nama nama_kelurahan_desa, area_kelurahan_desa.kode kode_kelurahan_desa, area_kelurahan_desa.id kelurahan_desa_id,
    business_ref_jenis_bhbu.id jenis_badan_hukum_badan_usaha_id, business_ref_jenis_bhbu.kode kode_badan_hukum, business_ref_jenis_bhbu.nama nama_badan_hukum,

    business_perusahaan.nama, business_perusahaan.nama_komersial,
    business_perusahaan.alamat, business_perusahaan.nomor_kode_area, business_perusahaan.kode_pos,
    business_perusahaan.kodese, business_perusahaan.latitude, business_perusahaan.longitude,
    business_perusahaan.tahun_beroperasi, business_perusahaan.tahun_pendirian, business_perusahaan.multi_national_status,
    business_perusahaan.skala_usaha, business_perusahaan.jam_buka, business_perusahaan.jam_tutup, business_perusahaan.jumlah_kamar,
    business_perusahaan.aset, business_perusahaan.npwp, business_perusahaan.pajak_tahun_pendaftarannpwp, business_perusahaan.pajak_tahunspt,
    business_perusahaan.pajak_tanggal_update, business_perusahaan.pendapatan_per_tahun, business_perusahaan.pengeluaran_per_tahun,
    business_perusahaan.pengusaha_pemilik, business_perusahaan.tanggal_lahir_pengusaha, business_perusahaan.jenis_kelamin_pengusaha,
    business_perusahaan.status_kepemilikan, business_perusahaan.tahun_ref_aset, business_perusahaan.tahun_ref_kompensasi_asing, 
    business_perusahaan.tahun_ref_kompensasi_lokal, business_perusahaan.tahun_ref_pendapatan, business_perusahaan.tahun_ref_pengeluaran,
    business_perusahaan.tahun_ref_skala_usaha, business_perusahaan.tahun_ref_tenaga_kerja_asing, business_perusahaan.tahun_ref_tenaga_kerja_lokal,
    business_perusahaan.total_kompensasi_asing_per_tahun, business_perusahaan.total_kompensasi_lokal_per_tahun, business_perusahaan.total_tenaga_kerja_asing_per_tahun,
    business_perusahaan.total_tenaga_kerja_lokal_per_tahun, business_perusahaan.unit_statistik

    from alokasi_petugas_assessment
    left join business_perusahaan on business_perusahaan.kode = alokasi_petugas_assessment.idsbr    
    left join business_ref_negara on business_ref_negara.id = business_perusahaan.negara_id
    left join area_provinsi on area_provinsi.id = business_perusahaan.provinsi_id
    left join area_kabupaten_kota on area_kabupaten_kota.id = business_perusahaan.kabupaten_kota_id
    left join area_kecamatan on area_kecamatan.id = business_perusahaan.kecamatan_id
    left join area_kelurahan_desa on area_kelurahan_desa.id = business_perusahaan.kelurahan_desa_id
    left join business_ref_jenis_bhbu on business_ref_jenis_bhbu.id = business_perusahaan.jenis_badan_hukum_badan_usaha_id
    where id_user = {{id_user}} and id_kegiatan = {{id_kegiatan}} and (is_assessment is null or is_assessment = 0) 
    order by newid()

    email[] = select * from business_alamat_email_perusahaan where perusahaan_id = {{id_perusahaan}}
    fax[] = select * from business_alamat_fax_perusahaan where perusahaan_id = {{id_perusahaan}}
    telepon[] = select * from business_alamat_telepon_perusahaan where perusahaan_id = {{id_perusahaan}}
    web[] = select * from business_alamat_web_perusahaan where perusahaan_id = {{id_perusahaan}}
    kontak_perusahaan[] = select * from business_kontak_perusahaan where perusahaan_id = {{id_perusahaan}}
    pemegang_saham[] = select * from business_pemegang_saham where perusahaan_id = {{id_perusahaan}}
    aktivitas[] = select * from business_aktivitas_perusahaan where perusahaan_id = {{id_perusahaan}}
    produk[] = select * from business_produk_perusahaan where perusahaan_id = {{id_perusahaan}}   
    


    -- kalo hasil dari query get data diatas jumlah row nya = 0 (semua data sbr sudah diassessment) maka kueri dibawah ini tidak perlu dieksekusi

    -- get data spool untuk di assessment
    select * from data_spool where id_kegiatan = {{id_kegiatan}} and idsbr = {{idsbr}}
    union
    select data_spool.* from data_spool left join matching_results on matching_results.id_spool = data_spool.id_spool
    where data_spool.idsbr is null and matching_results.idsbr = {{idsbr}}


13. POST api/kegiatan/{{id_kegiatan}}/assessment?action=process

    -- action: menyimpan hasil assessment
    -- input yang diterima backend:
    {
        'id_alokasi': ...,
        'idsbr': ...,                
        'nama': ...,
        'nama_komersial': ...,
        'alamat' : ...,
        'email': [],
        'fax': [],
        'telepon': [],
        'web': [],
        'kontak_perusahaan': [],
        'pemegang_saham': [],
        'aktivitas': [],
        'produk': [],
        .... dst
    }

    -- update status assessment
    update alokasi_petugas_assessment set is_assessment = 1 where id = {{id_alokasi}}

    -- belum beres ...
```
