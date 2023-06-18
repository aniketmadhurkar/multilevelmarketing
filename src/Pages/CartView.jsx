import React, { useEffect, useState } from "react"

const Products = () => {
    const [cartItems, setCartItems] = useState([]);
    const [products, setProducts] = useState([])

    const fetchProductsData = () => {
        fetch("http://localhost:8082/testweb/getProducts.jsp")
            .then(response => {
                return response.json()
            })
            .then(data => {
                setProducts(data)
            })
    }
    useEffect(() => {
        // Load cart data from local storage on page load
        const savedCart = localStorage.getItem('cart');
        if (savedCart) {
          setCartItems(JSON.parse(savedCart));
        }
      }, []);
    useEffect(() => {
        // Save cart data to local storage whenever it changes
        localStorage.setItem('cart', JSON.stringify(cartItems));
      }, [cartItems]);
    useEffect(() => {
        fetchProductsData()
    }, [])
    function ProductListing({ products, addToCart }) {
        return (
            <div>
                <h2>Product Listing</h2>
                <div className="row">


                    {products.map((product) => (
                        <div className="col-12 col-sm-8 col-md-6 col-lg-4 mt-2">
                            <div v key={product.id} className="card">
                                <div className="card-body">
                                <h4 class="card-title">{product.title}</h4>
                                    <p className="card-subtitle mb-2 text-muted">Price: ${product.price}</p>
                                    <p class="card-text">{product.description.substring(0, 150)} </p>
                                    <button className="btn btn-outline-primary btn-sm" onClick={() => addToCart(product)}>Add to Cart</button>
                                </div>
                            </div>
                        </div>

                    ))}
                </div>
            </div>
        );
    }

    const addToCart = (product) => {
        const existingItem = cartItems.find((item) => item.id === product.id);

        if (existingItem) {
            const updatedItems = cartItems.map((item) =>
                item.id === product.id ? { ...item, quantity: item.quantity + 1 } : item
            );
            setCartItems(updatedItems);
        } else {
            const newItem = { ...product, quantity: 1 };
            setCartItems([...cartItems, newItem]);
        }
    };

    const removeItem = (itemId) => {
        const updatedItems = cartItems.filter((item) => item.id !== itemId);
        setCartItems(updatedItems);
    };

    const updateQuantity = (itemId, newQuantity) => {
        const updatedItems = cartItems.map((item) =>
            item.id === itemId ? { ...item, quantity: newQuantity } : item
        );
        setCartItems(updatedItems);
    };
    return (
        <div>
            <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Products</h2>

                        </div>
                    </div>
                </div>
            </section>
            <section class="page-section" id="products">
                <div class="container">
                <Cart cartItems={cartItems} removeItem={removeItem} updateQuantity={updateQuantity} />
                    
                </div>
            </section>
        </div>
    );
};

export default Products