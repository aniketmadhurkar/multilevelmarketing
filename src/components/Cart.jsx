import React, { useEffect, useState } from "react"
import { CartContext } from '../context/CartContext';
import { Link, useNavigate } from 'react-router-dom';


const Cart = ({ cartItems, removeItem, updateQuantity }) => {
  const [cartItems2, setCartItems] = useState([]);
  // const { cartItems, removeFromCart } = useContext(CartContext);
  const navigate = useNavigate();

  const handleCheckout = () => {
    navigate('/checkout', { state: { cartItems: cartItems } });
  };

  useEffect(() => {
    const storedCartItems = localStorage.getItem('cartItems');
    if (storedCartItems) {
        setCartItems(JSON.parse(storedCartItems));
    }
}, []);

  const handleRemoveItem = (product) => {
    removeItem(product);
  };
  const handleUpdateQuantity = (itemId, newQuantity) => {
    updateQuantity(itemId, newQuantity);
  };



  return (
    <div>

      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {cartItems.map((item) => (
            <tr key={item.id}>
              <td>{item.title}</td>
              <td>{item.price}</td>
              <td>{item.quantity}</td>
              <td>
                <button className="btn btn-sm btn-danger" onClick={() => handleUpdateQuantity(item.id, item.quantity - 1)} disabled={item.quantity === 0}>-</button>&nbsp;
                <button className="btn btn-sm btn-secondary" onClick={() => handleUpdateQuantity(item.id, item.quantity + 1)}>+</button>&nbsp;
                <button className="btn btn-sm btn-secondary" onClick={() => handleRemoveItem(item.id)}>Remove</button>
              </td>
            </tr>

          ))}
        </tbody>
      </table>
      <button className="btn btn-primary mt-3" onClick={handleCheckout}>Checkout</button>
    </div>
  );
};

export default Cart