CREATE TABLE `bkpsdm_silat_biodata_s`(                            
   `pegawai_id` int,                                
   `skpd_id` varchar(15),                           
   `nip_baru` varchar(20),                          
   `nip_lama` varchar(10),                          
   `nuptk` varchar(20),                             
   `status_kep_id` int,                             
   `kppn_id` int,                                   
   `nama` varchar(100),                             
   `gelar_depan` varchar(30),                       
   `gelar_belakang` varchar(30),                    
   `tempat_lahir` varchar(30),                      
   `nik` varchar(25),                               
   `jk` varchar(4),                                 
   `agama_id` varchar(4),                           
   `status_kawin_id` varchar(4),                    
   `alamat` varchar(300),                           
   `domisili_id` int,                               
   `alamat_domisili` varchar(300),                  
   `kode_pos` varchar(6),                           
   `kode_pos_domisili` varchar(6),                  
   `no_hp` varchar(12),                             
   `email` varchar(50),                             
   `aktif` varchar(4),                              
   `tgl_input` date) 
    CLUSTERED BY (pegawai_id) INTO 4 BUCKETS 
    STORED AS ORC TBLPROPERTIES ('transactional'='true');
  
CREATE INDEX bkpsdm_silat_biodata_s_idx_pegawai_id ON TABLE bkpsdm_silat_biodata_s(pegawai_id) AS 'BITMAP' WITH DEFERRED REBUILD;
CREATE INDEX bkpsdm_silat_biodata_s_idx_nip ON TABLE bkpsdm_silat_biodata_s(nip_baru) AS 'BITMAP' WITH DEFERRED REBUILD;

/*Table structure for table `bkpsdm_silat_file_diri_s` */

CREATE TABLE `bkpsdm_silat_file_diri_s` (
  `file_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `file_foto` text,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_jenis_jabatan_s` */

CREATE TABLE `bkpsdm_silat_jenis_jabatan_s` (
  `jenis_jab_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jabatan_id` varchar(2) DEFAULT NULL,
  `bup` int(3) DEFAULT NULL,
  `tmt_pensiun` date DEFAULT NULL,
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time NOT NULL,
  `tgl_edit_bup` date DEFAULT NULL,
  `jam_edit_bup` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jenis_jab_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_kepegawaian_s` */

CREATE TABLE `bkpsdm_silat_kepegawaian_s` (
  `pegawai_id` int(11) NOT NULL,
  `asal_kep_id` int(2) DEFAULT NULL,
  `status_kep_id` int(2) DEFAULT NULL,
  `tmt_mutasi` date DEFAULT NULL,
  `asal_instansi` text,
  `instansi_pertama` text,
  `gaji_id` int(2) DEFAULT NULL,
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pegawai_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_ref_agama_s` */

CREATE TABLE `bkpsdm_silat_ref_agama_s` (
  `agama_id` int(2) NOT NULL,
  `agama` varchar(30) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`agama_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_asal_kepegawaian_s` */

CREATE TABLE `bkpsdm_silat_ref_asal_kepegawaian_s` (
  `asal_kep_id` int(2) NOT NULL,
  `asal_kep` varchar(50) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`asal_kep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_belajar_s` */

CREATE TABLE `bkpsdm_silat_ref_belajar_s` (
  `jenis_belajar_id` int(5) NOT NULL,
  `belajar` varchar(255) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jenis_belajar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_berhenti_jabatan_s` */

CREATE TABLE `bkpsdm_silat_ref_berhenti_jabatan_s` (
  `jenis_berhenti_id` int(2) NOT NULL,
  `berhenti_jabatan` varchar(30) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jenis_berhenti_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_bup_s` */

CREATE TABLE `bkpsdm_silat_ref_bup_s` (
  `bup` int(3) NOT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`bup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

/*Table structure for table `bkpsdm_silat_ref_eselon_s` */

CREATE TABLE `bkpsdm_silat_ref_eselon_s` (
  `eselon_id` int(20) NOT NULL,
  `eselon` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `nama_eselon` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`eselon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_hukuman_disiplin_s` */

CREATE TABLE `bkpsdm_silat_ref_hukuman_disiplin_s` (
  `id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `pId` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `open` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jabatan_struktural_s` */

CREATE TABLE `bkpsdm_silat_ref_jabatan_struktural_s` (
  `jab_struktural_id` int(3) NOT NULL,
  `jab_struktural` varchar(25) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jab_struktural_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jabatan_tambahan_s` */

CREATE TABLE `bkpsdm_silat_ref_jabatan_tambahan_s` (
  `jab_tambahan_id` int(2) NOT NULL,
  `jab_tambahan` varchar(30) NOT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jab_tambahan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jenis_jabatan_s` */

CREATE TABLE `bkpsdm_silat_ref_jenis_jabatan_s` (
  `jabatan_id` int(2) NOT NULL,
  `jenis_jabatan` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jabatan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jenis_kepegawaian_s` */

CREATE TABLE `bkpsdm_silat_ref_jenis_kepegawaian_s` (
  `jenis_kepegawaian_id` int(2) NOT NULL,
  `jenis_kepegawaian` varchar(100) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jenis_kepegawaian_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jft_s` */

CREATE TABLE `bkpsdm_silat_ref_jft_s` (
  `id` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `pId` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `tingkat` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `jenjang_jab` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `gol_ruang` varchar(5) CHARACTER SET latin1 DEFAULT NULL,
  `angka_kredit` int(5) DEFAULT NULL,
  `tunjangan_jab` int(11) DEFAULT NULL,
  `bup` int(3) DEFAULT NULL,
  `diklat` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `ket` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `jenjang_id` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `kualifikasi_id` int(3) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `open` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_jfu_s` */

CREATE TABLE `bkpsdm_silat_ref_jfu_s` (
  `id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `pId` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jenjang_id` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `kualifikasi_d` int(3) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `open` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `aktif` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_ref_pangkat_s` */

CREATE TABLE `bkpsdm_silat_ref_pangkat_s` (
  `pangkat_id` int(2) NOT NULL,
  `gol_ruang` varchar(5) DEFAULT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `kode_bkn` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pangkat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_rwyt_anak_s` */

CREATE TABLE `bkpsdm_silat_rwyt_anak_s` (
  `anak_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `suami_istri_id` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `status_anak_id` int(2) DEFAULT NULL,
  `pekerjaan_anak_id` int(2) DEFAULT NULL,
  `tunjangan` enum('Dapat','Tidak Dapat') DEFAULT NULL,
  `file_akta_anak` text,
  `file_ktp_anak` text,
  `file_askes_bpjs_anak` text,
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`anak_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_belajar_s` */

CREATE TABLE `bkpsdm_silat_rwyt_belajar_s` (
  `belajar_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_belajar_id` int(2) DEFAULT NULL,
  `jenjang_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `sekolah_pt` text,
  `fakultas` text,
  `prodi_jurusan` text,
  `file_belajar` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`belajar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_berhenti_jabatan_s` */

CREATE TABLE `bkpsdm_silat_rwyt_berhenti_jabatan_s` (
  `berhenti_jabatan_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_berhenti_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `ket` text,
  `file_berhenti_jabatan` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`berhenti_jabatan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_cuti_s` */

CREATE TABLE `bkpsdm_silat_rwyt_cuti_s` (
  `cuti_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_cuti_id` varchar(7) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `keterangan` text,
  `file_cuti` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`cuti_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_diklat_s` */

CREATE TABLE `bkpsdm_silat_rwyt_diklat_s` (
  `diklat_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_diklat_id` varchar(7) DEFAULT NULL,
  `nama_diklat` varchar(100) DEFAULT NULL,
  `no_sertifikat` varchar(100) DEFAULT NULL,
  `tgl_sertifikat` date DEFAULT NULL,
  `penyelenggara` varchar(200) DEFAULT NULL,
  `peran_id` int(11) DEFAULT NULL,
  `tingkat_id` varchar(30) DEFAULT NULL,
  `jml` double DEFAULT NULL,
  `satuan_id` int(2) DEFAULT NULL,
  `file_diklat` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`diklat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_fungsional_alihjenjang_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_fungsional_alihjenjang_s` (
  `fungsional_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jft_id` varchar(15) DEFAULT NULL,
  `induk` text,
  `instansi` text,
  `unit_kerja` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `pak` double DEFAULT NULL,
  `status_diangkat` enum('Pengangkatan Pertama','Sudah Diangkat','Diberhentikan Sementara','Diangkat Kembali') DEFAULT 'Pengangkatan Pertama',
  `status_fungsional_diklat_id` int(2) DEFAULT NULL,
  `file_jft` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`fungsional_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_fungsional_dokter_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_fungsional_dokter_s` (
  `pegawai_id` int(11) NOT NULL,
  `jenis_dokter_id` int(2) DEFAULT NULL,
  `spesialis_id` int(3) DEFAULT NULL,
  `unit_id` int(2) DEFAULT NULL,
  `nama_unit_kesehatan` varchar(50) DEFAULT NULL,
  `jml_pasien` int(5) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pegawai_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_fungsional_guru_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_fungsional_guru_s` (
  `guru_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `sekolah_induk` text,
  `sekolah_mengajar` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `jenis_ptk_id` int(2) DEFAULT NULL,
  `mapel_id` int(3) DEFAULT NULL,
  `file_guru` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`guru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_fungsional_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_fungsional_s` (
  `fungsional_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jft_id` varchar(15) DEFAULT NULL,
  `induk` text,
  `instansi` text,
  `unit_kerja` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `pak` double DEFAULT NULL,
  `status_diangkat` enum('Belum Diangkat','Sudah Diangkat','Diberhentikan Sementara','Diangkat Kembali') DEFAULT 'Belum Diangkat',
  `status_fungsional_diklat_id` int(2) DEFAULT NULL,
  `file_jft` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`fungsional_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_pelaksana_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_pelaksana_s` (
  `pelaksana_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jfu_id` int(2) DEFAULT NULL,
  `induk` text,
  `instansi` text,
  `unit_kerja` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `file_jfu` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pelaksana_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_ptk_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_ptk_s` (
  `guru_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `sekolah_induk` text,
  `sekolah_mengajar` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `jenis_ptk_id` int(2) DEFAULT NULL,
  `mapel_id` int(3) DEFAULT NULL,
  `file_guru` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`guru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_struktural_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_struktural_s` (
  `struktural_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `eselon_id` int(2) DEFAULT NULL,
  `pelantikan_struktural_id` int(2) DEFAULT NULL,
  `jab_struktural_id` int(2) DEFAULT NULL,
  `induk` text,
  `instansi` text,
  `unit_kerja` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_jab` date DEFAULT NULL,
  `tgl_pelantikan` date DEFAULT NULL,
  `status_struktural_id` int(2) DEFAULT NULL,
  `file_struktural` text,
  `file_pelantikan` text,
  `file_spmt` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`struktural_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jab_tambahan_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jab_tambahan_s` (
  `tambahan_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jab_tambahan_id` int(2) DEFAULT NULL,
  `jab_detail` text,
  `induk` text,
  `instansi` text,
  `unit_kerja` text,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `file_jab_tambahan` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`tambahan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_jenis_kepegawaian_s` */

CREATE TABLE `bkpsdm_silat_rwyt_jenis_kepegawaian_s` (
  `jenis_kepegawaian_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_peg_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `ket_instansi` text,
  `file_jenis_kepegawaian` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`jenis_kepegawaian_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_kedudukan_hukum_s` */

CREATE TABLE `bkpsdm_silat_rwyt_kedudukan_hukum_s` (
  `kedudukan_hukum_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `kedudukan_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `ket_instansi` text,
  `file_kedudukan_hukum` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`kedudukan_hukum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_mertua_s` */

CREATE TABLE `bkpsdm_silat_rwyt_mertua_s` (
  `mertua_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `tempat_lahir_ayah` varchar(30) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `alamat_ayah` text,
  `pekerjaan_id_ayah` int(2) DEFAULT NULL,
  `tgl_edit_ayah` date DEFAULT NULL,
  `jam_edit_ayah` time DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `tempat_lahir_ibu` varchar(30) DEFAULT NULL,
  `tgl_lahir_ibu` date DEFAULT NULL,
  `alamat_ibu` text,
  `pekerjaan_id_ibu` int(2) DEFAULT NULL,
  `tgl_edit_ibu` date DEFAULT NULL,
  `jam_edit_ibu` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`mertua_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_nikah_s` */

CREATE TABLE `bkpsdm_silat_rwyt_nikah_s` (
  `nikah_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `status_kawin_id` int(2) DEFAULT '1',
  `tgl_nikah_duda_janda` date DEFAULT NULL,
  `file_surat_nikah_cerai` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`nikah_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_orangtua_s` */

CREATE TABLE `bkpsdm_silat_rwyt_orangtua_s` (
  `orangtua_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `tempat_lahir_ayah` varchar(30) DEFAULT NULL,
  `tgl_lahir_ayah` date DEFAULT NULL,
  `alamat_ayah` text,
  `pekerjaan_id_ayah` int(2) DEFAULT NULL,
  `tgl_edit_ayah` date DEFAULT NULL,
  `jam_edit_ayah` time DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `tempat_lahir_ibu` varchar(30) DEFAULT NULL,
  `tgl_lahir_ibu` date DEFAULT NULL,
  `alamat_ibu` text,
  `pekerjaan_id_ibu` int(2) DEFAULT NULL,
  `tgl_edit_ibu` date DEFAULT NULL,
  `jam_edit_ibu` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`orangtua_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_pak_s` */

CREATE TABLE `bkpsdm_silat_rwyt_pak_s` (
  `pak_id` int(6) NOT NULL,
  `pegawai_id` int(6) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `nilai_pak` double DEFAULT NULL,
  `rekomendasi` varchar(50) DEFAULT NULL,
  `file_pak` varchar(100) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pak_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_pangkat_s` */

CREATE TABLE `bkpsdm_silat_rwyt_pangkat_s` (
  `kp_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `pangkat_id` int(2) DEFAULT NULL,
  `jenis_kp_id` varchar(5) DEFAULT NULL,
  `masa_kerja_tahun` decimal(2,0) DEFAULT NULL,
  `masa_kerja_bulan` decimal(2,0) DEFAULT NULL,
  `masa_kerja` double DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `no_bkn` varchar(30) DEFAULT NULL,
  `tgl_bkn` date DEFAULT NULL,
  `tmt_pangkat` date DEFAULT NULL,
  `status_pangkat` enum('Belum Puncak','Puncak') DEFAULT 'Belum Puncak',
  `ket` text,
  `file_pangkat` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT '00:00:00',
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`kp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_pendidikan_s` */

CREATE TABLE `bkpsdm_silat_rwyt_pendidikan_s` (
  `pendidikan_id` int(11) NOT NULL,
  `pegawai_id` int(25) DEFAULT '0',
  `jenjang_id` int(2) DEFAULT NULL,
  `pt_id` int(5) DEFAULT NULL,
  `fakultas_pt` varchar(30) DEFAULT NULL,
  `prodi_id` int(5) DEFAULT NULL,
  `akreditasi_pt` varchar(4) DEFAULT NULL,
  `thn_lulus_pt` int(4) DEFAULT NULL,
  `no_ijazah_pt` varchar(20) DEFAULT NULL,
  `tgl_ijazah_pt` date DEFAULT NULL,
  `ipk_pt` double DEFAULT NULL,
  `nama_sekolah_sma` varchar(100) DEFAULT NULL,
  `jurusan_sma` varchar(100) DEFAULT NULL,
  `akreditasi_sma` varchar(4) DEFAULT NULL,
  `thn_lulus_sma` int(4) DEFAULT NULL,
  `no_ijazah_sma` varchar(20) DEFAULT NULL,
  `tgl_ijazah_sma` date DEFAULT NULL,
  `nilai_akhir_sma` double DEFAULT NULL,
  `nilai_un_sma` double DEFAULT NULL,
  `file_ijazah` varchar(100) DEFAULT NULL,
  `file_nilai` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pendidikan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_penghargaan_s` */

CREATE TABLE `bkpsdm_silat_rwyt_penghargaan_s` (
  `penghargaan_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `nama_penghargaan` varchar(200) DEFAULT NULL,
  `tingkat_penghargaan_id` int(6) DEFAULT NULL,
  `tahun` varchar(20) DEFAULT NULL,
  `instansi_pemberi` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `file_penghargaan` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`penghargaan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_pindah_s` */

CREATE TABLE `bkpsdm_silat_rwyt_pindah_s` (
  `pindah_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_pindah_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_pindah` date DEFAULT NULL,
  `induk_asal` text,
  `instansi_asal` text,
  `induk_tujuan` text,
  `instansi_tujuan` text,
  `file_pindah` text,
  `file_spmt` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`pindah_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_satyalencana_s` */

CREATE TABLE `bkpsdm_silat_rwyt_satyalencana_s` (
  `satyalencana_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_satyalencana_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `file_satyalencana` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`satyalencana_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_sertifikasi_guru_s` */

CREATE TABLE `bkpsdm_silat_rwyt_sertifikasi_guru_s` (
  `sertifikasi_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `tunjangan_id` int(1) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `file_sertifikasi` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`sertifikasi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_sip_s` */

CREATE TABLE `bkpsdm_silat_rwyt_sip_s` (
  `sip_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jft_id` varchar(15) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `file_sip` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`sip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_sklu_s` */

CREATE TABLE `bkpsdm_silat_rwyt_sklu_s` (
  `sklu_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenis_sklu_id` int(2) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `file_sklu` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`sklu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_skp_s` */

CREATE TABLE `bkpsdm_silat_rwyt_skp_s` (
  `skp_id` int(11) NOT NULL,
  `pegawai_id` int(6) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `angka` double DEFAULT NULL,
  `sebutan` varchar(20) DEFAULT NULL,
  `rekomendasi` text,
  `file_skp` varchar(100) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`skp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_str_s` */

CREATE TABLE `bkpsdm_silat_rwyt_str_s` (
  `str_id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jft_id` varchar(15) DEFAULT NULL,
  `no_sk` varchar(30) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `file_str` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`str_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_rwyt_suami_istri_s` */

CREATE TABLE `bkpsdm_silat_rwyt_suami_istri_s` (
  `suami_istri_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `nama_suami_istri` varchar(50) DEFAULT NULL,
  `status_suami_istri_id` int(2) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pekerjaan_id` int(2) DEFAULT NULL,
  `nip_nrp` varchar(30) DEFAULT NULL,
  `instansi` varchar(200) DEFAULT NULL,
  `file_foto_suami_istri` text,
  `file_ktp_suami_istri` text,
  `file_askes_bpjs_suami_istri` text,
  `aktif` enum('Y','N') DEFAULT 'N',
  `tgl_edit` date DEFAULT NULL,
  `jam_edit` time DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`suami_istri_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_skpd_bezzeting_s` */

CREATE TABLE `bkpsdm_silat_skpd_bezzeting_s` (
  `id` varchar(20) DEFAULT NULL,
  `pId` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `open` varchar(10) DEFAULT NULL,
  `eselon_id` int(2) DEFAULT NULL,
  `jabatan_id` int(3) NOT NULL,
  `total` int(6) NOT NULL DEFAULT '0',
  `jml_kebutuhan` int(6) DEFAULT NULL,
  `selisih` double NOT NULL,
  `sesuai_tupoksi` enum('Y','N') DEFAULT 'Y',
  `tgl_load` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bkpsdm_silat_sotk_s` */

CREATE TABLE `bkpsdm_silat_sotk_s` (
  `id` varchar(30) NOT NULL,
  `pId` varchar(30) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nip_baru` varchar(20) DEFAULT NULL,
  `gol_ruang` varchar(5) DEFAULT NULL,
  `eselon` varchar(20) DEFAULT NULL,
  `nama_eselon` varchar(200) DEFAULT NULL,
  `file_foto` text,
  `pegawai_id` int(11) DEFAULT NULL,
  `tgl_load` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `bkpsdm_silat_statistik_umur_s` */

CREATE TABLE `bkpsdm_silat_statistik_umur_s` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

 
