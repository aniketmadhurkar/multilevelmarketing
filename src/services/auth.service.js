import { useState, useEffect } from 'react';

function useAuth() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [user_id, setUserID] = useState('');
  const [user_name, setUserName] = useState('');

  useEffect(() => {
    const logged_in = localStorage.getItem('logged_in');
    const stored_user_id = localStorage.getItem('user_id');
    const stored_user_name = localStorage.getItem('user_name');

    setIsLoggedIn(!!logged_in);
    setUserID(stored_user_id || '');
    setUserName(stored_user_name || '');

  }, []);

  return { isLoggedIn, user_id, user_name };
}

export default useAuth;
