import { useState, useEffect } from 'react';

function useCart() {
  const [cartItems, setCartItems] = useState([]);

  // Retrieve cart items from local storage on component mount
  useEffect(() => {
    const storedCartItems = localStorage.getItem('cartItems');
    if (storedCartItems) {
      setCartItems(JSON.parse(storedCartItems));
    }
  }, []);

  // Save cart items to local storage whenever it changes
  useEffect(() => {
    localStorage.setItem('cartItems', JSON.stringify(cartItems));
  }, [cartItems]);

  // Add an item to the cart
  const addItemToCart = (item) => {
    setCartItems((prevItems) => [...prevItems, item]);
  };

  // Remove an item from the cart
  const removeItemFromCart = (itemId) => {
    setCartItems((prevItems) =>
      prevItems.filter((item) => item.id !== itemId)
    );
  };

  // Clear all items from the cart
  const clearCart = () => {
    setCartItems([]);
  };

  // Calculate the total number of items in the cart
  const getTotalItemsCount = () => {
    return cartItems.reduce((count, item) => count + item.quantity, 0);
  };

  // Calculate the total price of all items in the cart
  const getTotalPrice = () => {
    return cartItems.reduce(
      (total, item) => total + item.price * item.quantity,
      0
    );
  };
  const updateQuantity = (itemId, newQuantity) => {
    const updatedItems = cartItems.map((item) =>
        item.id === itemId ? { ...item, quantity: newQuantity } : item
    );
    setCartItems(updatedItems);
};
  return {
    cartItems,
    addItemToCart,
    removeItemFromCart,
    clearCart,
    getTotalItemsCount,
    getTotalPrice,
    updateQuantity
  };
}

export default useCart;
