CREATE TABLE `categories` (
	`id` varchar(36) NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO `imersao17`.`categories` (`id`, `name`) VALUES ("99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "Relógios");
INSERT INTO `imersao17`.`categories` (`id`, `name`) VALUES ("85d5417d-b588-428f-90a0-69bb5e4408bf", "Eletrônicos");

CREATE TABLE `products` (
	`id` varchar(36) NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`price` decimal(10,2) NOT NULL,
	`category_id` varchar(36) NOT NULL,
	`image_url` varchar(255) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_product_category FOREIGN KEY (category_id)
	REFERENCES categories(id)
);

INSERT INTO `imersao17`.`products` (`id`,`name`,`description`,`price`,`category_id`,`image_url`)
VALUES (UUID(),"Product 1","Description 1", 100, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/1.png"),
       (UUID(),"Product 2","Description 2", 200, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/2.png"),
       (UUID(),"Product 3","Description 3", 300, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/3.png"),
       (UUID(),"Product 4","Description 4", 400, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/4.png"),
       (UUID(),"Product 5","Description 5", 500, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/5.png"),
       (UUID(),"Product 6","Description 6", 600, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/6.png"),
       (UUID(),"Product 7","Description 7", 700, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/7.png"),
       (UUID(),"Product 8","Description 8", 800, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/8.png"),
       (UUID(),"Product 9","Description 9", 900, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/9.png"),
       (UUID(),"Product 10","Description 10", 1000, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/10.png"),
       (UUID(),"Product 11","Description 11", 1100, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/11.png"),
       (UUID(),"Product 12","Description 12", 1200, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/12.png"),
       (UUID(),"Product 13","Description 13", 1300, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/13.png"),
       (UUID(),"Product 14","Description 14", 1400, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/14.png"),
       (UUID(),"Product 15","Description 15", 1500, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/15.png"),
       (UUID(),"Product 16","Description 16", 1600, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/16.png"),
       (UUID(),"Product 17","Description 17", 1700, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/17.png"),
       (UUID(),"Product 18","Description 18", 1800, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/18.png"),
       (UUID(),"Product 19","Description 19", 1900, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/19.png"),
       (UUID(),"Product 20","Description 20", 2000, "99bf7f04-2678-4e75-9a25-cb11e3aac6dd", "http://localhost:9000/products/20.png");