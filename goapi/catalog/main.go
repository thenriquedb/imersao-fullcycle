package main

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	_ "github.com/go-sql-driver/mysql"
	"github.com/thenriquedb/imersao-fullcycle-17/goapi/internal/database"
	"github.com/thenriquedb/imersao-fullcycle-17/goapi/internal/service"
	"github.com/thenriquedb/imersao-fullcycle-17/goapi/internal/webserver"
)

func main() {
	db, err := sql.Open("mysql", "root:root@tcp(localhost:3306)/imersao17")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	categoryDB := database.NewCategoryDB(db)
	categoryService := service.NewCategoryService(*categoryDB)

	productDB := database.NewProductDB(db)
	productService := service.NewProductService(*productDB)

	webCategoryHandler := webserver.NewWebCategoryHandler(categoryService)
	webProductHandler := webserver.NewWebProductHandler(productService)

	c := chi.NewRouter()
	c.Use(middleware.Logger)
	c.Use(middleware.Recoverer)

	c.Get("/category", webCategoryHandler.GetCategories)
	c.Get("/category/{id}", webCategoryHandler.GetCategory)
	c.Post("/category", webCategoryHandler.CreateCategory)

	c.Get("/product", webProductHandler.GetProducts)
	c.Get("/product/{id}", webProductHandler.GetProduct)
	c.Get("/product/category/{categoryID}", webProductHandler.GetProductsByCategoryID)
	c.Post("/product", webProductHandler.CreateProduct)

	fmt.Println("Server is running on port 8080")
	http.ListenAndServe(":8080", c)
}
