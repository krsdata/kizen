CREATE TABLE Category(

    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    description VARCHAR(255),
    image_url VARCHAR(50),
    is_active BOOLEAN,
    
    CONSTRAINT pk_category_id PRIMARY KEY (id) 

);

INSERT INTO Category (name, description, image_url,is_active) VALUES ('Steel','this is description for Steel category!','CAT_1.png',true)
INSERT INTO Category (name, description, image_url,is_active) VALUES ('Aluminium','this is description for Aluminium category!','CAT_2.png',true)
INSERT INTO Category (name, description, image_url,is_active) VALUES ('Copper','this is description for Copper category!','CAT_3.png',true)


DROP TABLE IF EXISTS `kaizendb`.`user_detail`;
CREATE TABLE  `kaizendb`.`user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `passwords` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO user_detail (first_name, last_name,role, enabled, passwords,email,contact_number) VALUES ('Sudhir','DAVANG','ADMIN',true ,'admin','sudhir.davang@gmail.com','9673492555');

DROP TABLE IF EXISTS `kaizendb`.`product`;
CREATE TABLE  `kaizendb`.`product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_product_category_id` (`category_id`),
  KEY `fk_product_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO product (code, name, material, description,is_active,category_id,supplier_id) VALUES ('PRDABC123DEF','PU COATING ROLLERS','Polyurethane Rubber','High mechanical strength, wear resistance, anti-aging and oil resistance',true,1,1);

INSERT INTO product (code, name, material, description,is_active,category_id,supplier_id) VALUES ('PRDDEF123PQR','GEARS & PULLEYS ','Stainless Steel','This is particularly true in saltwater environments',true,2,1);

INSERT INTO product (code, name, material, description,is_active,category_id,supplier_id) VALUES ('PRDGHI123MNO','SPROCKETS','Stainless Steel,Steel','Hardened Steel Teeth Material, Lubrication None, Maintains Proper Chain Tension',true,2,1);

INSERT INTO product (code, name, material, description,is_active,category_id,supplier_id) VALUES ('PRDJKL123STW','POLYURETHANE CASTER WHEEL & NYLON WHEELS','Polyurethane, rubber, cast iron, nylon','our castor range offers a solution to any kind of industry application',true,1,1);
