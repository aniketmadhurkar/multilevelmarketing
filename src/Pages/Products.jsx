import React, { useEffect, useState } from "react"
import { Link, useNavigate } from 'react-router-dom';
import useAuth from "../services/auth.service";
import Cart from "../components/Cart";
import UserMenu from "../components/UserMenu";
import { PRODUCTS_URL } from "../apiUrls";
const Products = () => {
    const { isLoggedIn, user_id, user_name } = useAuth();

    const [cartItems, setCartItems] = useState([]);
    const [products, setProducts] = useState([])

    useEffect(() => {
        localStorage.setItem('cartItems', JSON.stringify(cartItems));
    }, [cartItems]);

    useEffect(() => {
        const storedCartItems = localStorage.getItem('cartItems'); console.log(storedCartItems);
        if (storedCartItems) {
            setCartItems(JSON.parse(storedCartItems));
        }
    }, []);
    const fetchProductsData = () => {
        fetch(PRODUCTS_URL)
            .then(response => {
                return response.json()
            })
            .then(data => {
                setProducts(data)
            })
    }
    useEffect(() => {
        const storedCartItems = localStorage.getItem('cartItems');
        if (storedCartItems) {
            setCartItems(JSON.parse(storedCartItems));
        }
    }, []);
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
    const updateQuantity = (itemId, newQuantity) => {
        if (newQuantity === 0) {
            removeItem(itemId);
            return;
        }

        const updatedItems = cartItems.map((item) => {
            if (item.id === itemId) {
                return { ...item, quantity: newQuantity, price: item.start_price * newQuantity };
            }
            return item;
        });

        setCartItems(updatedItems);
    };
    const removeItem = (itemId) => {
        const updatedItems = cartItems.filter((item) => item.id !== itemId);
        setCartItems(updatedItems);
    };

    useEffect(() => {
        fetchProductsData()
    }, [])

    return (
        <div>
            {!isLoggedIn ? <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Products</h2>
                            {isLoggedIn}
                        </div>
                    </div>
                </div>
            </section> : <UserMenu />}

            <section class="page-section" id="products">
                <div class="container">
                    <div>
                        <h2>Product Listing</h2>
                        <div className="row">

                            {products.map((product) => (
                                <div className="col-12 col-sm-8 col-md-6 col-lg-4 mt-2">
                                    <div v key={product.id} className="card">
                                        <div className="card-body">
                                            <img src={product.image} alt=""  width="100%" height="160px"/>
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
                    <br className="mt-3" />

                </div>
            </section>
            <section class="facts-area dark-bg" id="products">
                <div class="container">
                    <h2>Cart</h2>
                </div>
            </section>
            <section class="facts-area " id="products">
                <div class="container">
                    <Cart cartItems={cartItems} removeItem={removeItem} updateQuantity={updateQuantity} />
                </div>
            </section>
        </div>
    );
};

export default Products