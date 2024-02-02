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
INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `image_url`) 
VALUES 
('2be82129-cf3b-46ab-bd2c-acf7cb13917d', 'Product 1', 'Description product 1', 100, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/1.png'),
('5a925810-1ab2-4bab-a4c1-d8e0419c1e7f', 'Product 2', 'Description product 2', 200, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/2.png'),
('10c83bae-cf4b-4564-b38a-5c15a4d6f0da', 'Product 3', 'Description product 3', 230, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/3.png'),
('f435d8e7-84db-4f1b-92a7-e88e7351e497', 'Product 4', 'Description product 4', 150, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/4.png'),
('6f13d8cd-8a6e-4084-97db-e6c2c635f0c8', 'Product 5', 'Description product 5', 180, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/5.png'),
('ca9b23c3-2b08-42db-99ac-cf9d8b7a6f9e', 'Product 6', 'Description product 6', 120, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/6.png'),
('a9f14e9d-4e7a-4e87-8913-1bcf2ef79c4d', 'Product 7', 'Description product 7', 250, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/7.png'),
('ed23a755-717c-4f8d-90b0-3f44b9a7c816', 'Product 8', 'Description product 8', 90, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/8.png'),
('9ff96e62-9f38-4341-bba6-3e4b3562ad9c', 'Product 9', 'Description product 9', 170, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/9.png'),
('4b59fc2d-3e9f-4aae-8237-b1efc717f3b8', 'Product 10', 'Description product 10', 130, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/10.png'),
('c5c7115f-795c-4a9c-8aeb-57d0eef9f6e7', 'Product 11', 'Description product 11', 190, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/11.png'),
('b3b6b6ab-811d-4a8d-b453-2c3c3bbabf58', 'Product 12', 'Description product 12', 110, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/12.png'),
('a6b35c01-af32-40e1-9602-4871d0d1f862', 'Product 13', 'Description product 13', 200, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/13.png'),
('e2b0e34f-1862-4f1a-b05d-745779f6cbea', 'Product 14', 'Description product 14', 140, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/14.png'),
('80a798bf-cdf9-4eb9-b711-5e0a1a91db5e', 'Product 15', 'Description product 15', 160, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/15.png'),
('f2ed5ba3-df7f-4d6b-92d4-87e540c9a90d', 'Product 16', 'Description product 16', 220, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/16.png'),
('e55400c2-4bfc-4cf9-9ce5-4787a27c5711', 'Product 17', 'Description product 17', 120, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/17.png'),
('17aa763e-0efb-4462-bb0f-d1d3d86d7a06', 'Product 18', 'Description product 18', 180, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/18.png'),
('b98c0f4d-451c-4b37-bc5a-2c44ff823d31', 'Product 19', 'Description product 19', 90, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/19.png'),
('5b1f0513-06b5-439b-909b-e1bb46d03e1b', 'Product 20', 'Description product 20', 200, '99bf7f04-2678-4e75-9a25-cb11e3aac6dd', 'http://localhost:9000/products/20.png');
