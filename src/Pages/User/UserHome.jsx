import React, { useEffect, useState } from "react"

import { Navigate } from "react-router-dom";
import useAuth from "../../services/auth.service";
import UserMenu from "../../components/UserMenu";
const UserHome = () => {
    const { isLoggedIn, user_id, user_name } = useAuth();
    if (!localStorage.getItem('logged_in')) {
        return (<Navigate replace to="/login" />);
    } else {
        return (
            <div>
                <UserMenu />
                <section class="page-section" id="contact">
                    <div class="container px-4 px-lg-5">
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6 text-center">
                                <h2 class="mt-0" id={user_id}>Welcome {user_name}</h2>
                                <hr class="divider" />

                            </div>
                        </div>
                        <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                            <div class="col-lg-6">


                            </div>
                        </div>

                    </div>
                </section>
            </div>
        );
    };
}

export default UserHome