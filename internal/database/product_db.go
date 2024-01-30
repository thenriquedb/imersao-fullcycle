package database

import (
	"database/sql"

	"github.com/thenriquedb/imersao-fullcycle-17/goapi/internal/entity"
)

type ProductDB struct {
	db *sql.DB
}

func NewProductDB(db *sql.DB) *ProductDB {
	return &ProductDB{
		db: db,
	}
}

func (pd *ProductDB) GetProducts() ([]*entity.Product, error) {
	rows, err := pd.db.Query("SELECT id, name, description, image_url, price, category_id FROM products")
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	var products []*entity.Product

	for rows.Next() {
		var product entity.Product

		if err := rows.Scan(
			&product.ID,
			&product.Name,
			&product.Description,
			&product.ImageURL,
			&product.Price,
			&product.CategoryID,
		); err != nil {
			return nil, err
		}

		products = append(products, &product)
	}

	return products, nil
}

func (pd *ProductDB) CreateProduct(product entity.Product) (string, error) {
	_, err := pd.db.Exec(
		"INSERT INTO products (id, name, description, image_url, category_id, price) VALUES (?, ?, ?, ?, ?, ?)",
		product.ID,
		product.Name,
		product.Description,
		product.ImageURL,
		product.CategoryID,
		product.Price,
	)

	if err != nil {
		return "", err
	}
	return product.ID, nil
}

func (pd *ProductDB) GetProduct(id string) (*entity.Product, error) {
	var product entity.Product
	err := pd.db.QueryRow(
		"SELECT id, name, description, price, image_url, category_id FROM products WHERE id = ?", id).Scan(
		&product.ID,
		&product.Name,
		&product.Description,
		&product.Price,
		&product.ImageURL,
		&product.CategoryID)

	if err != nil {
		return nil, err
	}

	return &product, nil
}

func (pd *ProductDB) GetProductByCategoryID(categoryID string) ([]*entity.Product, error) {
	rows, err := pd.db.Query("SELECT id, name, description, image_url, price, category_id FROM products WHERE category_id = ?", categoryID)

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	var products []*entity.Product

	for rows.Next() {
		var product entity.Product

		if err := rows.Scan(
			&product.ID,
			&product.Name,
			&product.Description,
			&product.ImageURL,
			&product.Price,
			&product.CategoryID,
		); err != nil {
			return nil, err
		}

		products = append(products, &product)
	}

	return products, nil
}
