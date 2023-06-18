import React from 'react'

const UserMenu = () => {
    return (
        <div class="page-section bg-primary" >
        <div class="site-navigation2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-dark p-0">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div id="navbar-collapse" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav mr-auto">
                                <li class="nav-item active"><a class="nav-link" href="/userhome">UserHome</a></li>
                                <li class="nav-item"><a class="nav-link" href="/usercommisions">Commisions</a></li>
                                <li class="nav-item"><a class="nav-link" href="/usertree">User Tree</a></li>
                                <li class="nav-item"><a class="nav-link" href="/userpurchasehistory">View Purchase History</a></li>
                                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                                {/* <li class="nav-item"><a class="nav-link" href="/cart">Cart</a></li> */}
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

        </div>
    </div>
    </div>
    );
};

export default UserMenu