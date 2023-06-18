import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Navigation from './components/Navigation';
import Home from './Pages/Home';
import About from './Pages/About';
import Contact from './Pages/Contact'
import Services from './Pages/Services'
import Products from './Pages/Products'
import Login from './Pages/Login'
import Registration from './Pages/Registration'
import UserHome from './Pages/User/UserHome'
import Header from "./components/Header";
import Footer from "./components/Footer";
import Checkout from "./Pages/Checkout";
import UserCommision from "./Pages/User/UserCommision";
import UserTeee from "./Pages/User/UserTeee";
import UserPurchaseHistory from "./Pages/User/UserPurchaseHistory";
import UserPurchaseDetail from "./Pages/User/UserPurchaseDetail";
import Logout from "./Pages/Logout";

function App() {
  return (
    <div className="App">
      <div className="body-inner">
        <Header />
        <Navigation />
        <Router>
          <Routes>
            <Route exact path="/" element={<Home />} />
            <Route exact path="/about" element={<About />} />
            <Route exact path="/contact" element={<Contact />} />
            <Route exact path="/services" element={<Services />} />
            <Route exact path="/products" element={<Products />} />
            <Route exact path="/login" element={<Login />} />
            <Route exact path="/logout" element={<Logout />} />
            <Route exact path="/registration" element={<Registration />} />
            <Route exact path="/checkout" element={<Checkout />} />
            <Route exact path="/userhome" element={<UserHome />} />
            <Route exact path="/usercommisions" element={<UserCommision />} />
            <Route exact path="/usertree" element={<UserTeee />} />
            <Route exact path="/userpurchasehistory" element={<UserPurchaseHistory />} />
            <Route exact path="/userpurchasedetail/:id" element={<UserPurchaseDetail />} />
          </Routes>
        </Router>

        <Footer />
      </div>
    </div>
  );
}

export default App;