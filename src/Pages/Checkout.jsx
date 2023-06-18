import React, { useEffect, useState } from "react"
import { useLocation } from 'react-router-dom';
import useAuth from "../services/auth.service";
import { Link, useNavigate } from 'react-router-dom';
import UserMenu from "../components/UserMenu";
function Checkout() {
    const { isLoggedIn, user_id, user_name } = useAuth();
    const location = useLocation();
    //const cartItems = location.state.cartItems;
    const [cartItems, setCartItems] = useState([]);
    const [productIds, setProductIds] = useState([]);
    const [quantities, setQuantities] = useState([]);
    const [totalAmount, setTotalAmount] = useState(0);


    useEffect(() => {
        const storedCartItems = localStorage.getItem('cartItems');
        if (storedCartItems) {
            setCartItems(JSON.parse(storedCartItems));
        }
    }, []);

    useEffect(() => {
        const ids = cartItems.map((item) => item.id);
        const quantities = cartItems.map((item) => item.quantity);
        setProductIds(ids);
        setQuantities(quantities);

        const amount = cartItems.reduce(
            (total, item) => total + item.price * item.quantity,
            0
        );
        setTotalAmount(amount);
    }, [cartItems]);
    const handleLogin = () => {
        localStorage.setItem('cartItems', JSON.stringify(cartItems));
    };
    const handleSubmit = (e) => {
        e.preventDefault();
        if (!isLoggedIn) {
            console.log('Please login first.' + user_name);
            return;
        }
        const form = e.target;
        const formData = new FormData(form);

        const searchParams = new URLSearchParams(location.search);
        for (let [name, value] of formData) {
            searchParams.append(name, value);
        }
        console.log('user .' + user_name + ": id=" + user_id + " log=" + isLoggedIn);
        const queryString = searchParams.toString();
        const url = `${location.pathname}?${queryString}`;
        // console.log('Updated URL:', url);
        try {
            fetch("http://localhost:8082/testweb/api/add-order.jsp?" + queryString)
                .then(response => {
                    return response.json()
                })
                .then(data => {
                    if (data) {
                        if (data.added == 1) {
                            console.log("added");
                            //window.location.href = 'http://localhost:8082/testweb/user/home.jsp'; 
                            //navigate("/user-home");
                            //navigate("/usertree");
                        }
                        else {
                            console.log("not added");
                        }
                    }

                })


        } catch (error) {
            // Handle error
            console.error('Error:', error);
        }
    };

    return (
        <div>
            {!isLoggedIn ? '' : <UserMenu/>} 
            <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Checkout</h2>

                        </div>
                    </div>
                </div>
            </section>
            <section class="page-section" id="products">
                <div class="container">
                    <div>
                        <form onSubmit={handleSubmit}>
                            <input type="hidden" name="user_id" value={!isLoggedIn ? 0 : user_id} />
                            <input type="hidden" name="total_amount" value={totalAmount} />
                            <table className="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {cartItems.map((item) => (
                                        <tr key={item.id}>
                                            <td>{item.title}</td>
                                            <td>{item.start_price}</td>
                                            <td>{item.quantity}</td>
                                            <td>{item.price}</td>
                                        </tr>
                                    ))}
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colSpan="3">Total Amount:</td>
                                        <td>{totalAmount}</td>
                                    </tr>
                                </tfoot>
                            </table>

                            {productIds.map((id) => (
                                <input key={id} type="hidden" name="product_id" value={id} />
                            ))}
                            {quantities.map((quantity) => (
                                <input key={quantity} type="hidden" name="quantity" value={quantity} />
                            ))}


                            {!isLoggedIn ? (
                                <p>
                                    Please{' '}
                                    <Link to="/login" onClick={handleLogin}>
                                        <span className="btn btn-link-primary text-primary">Login</span>
                                    </Link>{' '}
                                    here.
                                </p>
                            ) : (<button className="btn btn-primary mt-3" type="submit">Submit</button>)}
                        </form>
                    </div>
                </div>
            </section>
        </div>

    );
}

export default Checkout;
