-- whsakila2021.customer definition

CREATE TABLE `customer` (
  `customer_id` smallint(5) NOT NULL,
  `nama` varchar(90) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- whsakila2021.fakta_pendapatan definition

CREATE TABLE `fakta_pendapatan` (
  `time_id` int(5) NOT NULL,
  `customer_id` smallint(5) NOT NULL,
  `store_id` smallint(3) NOT NULL,
  `film_id` smallint(5) NOT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `lamapinjam` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- whsakila2021.film definition

CREATE TABLE `film` (
  `film_id` smallint(5) NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `kategori` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- whsakila2021.store definition

CREATE TABLE `store` (
  `store_id` smallint(3) NOT NULL,
  `nama_kota` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- whsakila2021.`time` definition

CREATE TABLE `time` (
  `time_id` int(5) NOT NULL AUTO_INCREMENT,
  `tahun` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `bulan` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `tanggal` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `tanggallengkap` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `namahari` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;