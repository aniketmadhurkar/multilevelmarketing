import React from 'react'

const Header = () => {
    return (
        <header id="header" class="header-one">
            <div class="bg-white">
                <div class="container">
                    <div class="logo-area">
                        <div class="row align-items-center">
                            <div class="logo col-lg-3 text-center text-lg-left mb-3 mb-md-5 mb-lg-0">
                                <a class="d-block" href="/">
                                    MLM
                                </a>
                            </div>

                            <div class="col-lg-9 header-right">

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="site-navigation">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div id="navbar-collapse" class="collapse navbar-collapse">
                                    <ul class="nav navbar-nav mr-auto">

                                        <li class="nav-item active"><a class="nav-link" href="/">Home</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/products">Products</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/services">Services</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                                        <li class="nav-item"><a class="nav-link" href="http://localhost:8082/testweb/admin/login.jsp" target="_blank">Admin Login</a></li>
                                        {/* <li class="nav-item"><a class="nav-link" href="/cart">Cart</a></li> */}
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
        </header>
    );
};

export default Header