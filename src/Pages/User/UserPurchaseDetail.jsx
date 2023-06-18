import React, { useEffect, useState } from "react"

import useAuth from "../../services/auth.service";
import UserMenu from "../../components/UserMenu";
import { PURCHASE_DETAIL_URL } from "../../apiUrls";
import { Navigate } from "react-router-dom";
const UserPurchaseDetail = () => {
    const { isLoggedIn, user_id, user_name } = useAuth();
    const [table_data, setTableDate] = useState([]);
    const fetchData = () => {
        fetch(PURCHASE_DETAIL_URL+"?id=1" + user_id)
            .then(response => {
                return response.json()
            })
            .then(data => {
                setTableDate(data);
            })
    }
    useEffect(() => {
        fetchData()
    }, [])
    if (!localStorage.getItem('logged_in')) {
         return (<Navigate replace to="/login" />);
    } else {
        return (
            <div>
                <UserMenu />

                <section class="page-section" id="contact">
                    <div class="container px-4 px-lg-5">
                        <div class="row gx-4 gx-lg-5">
                            <div class="col-lg-8 col-xl-6 ">
                                <h2 class="mt-0">Purchase Detail</h2>
                            </div>
                        </div>
                        <div class="row  justify-content-center mb-5">
                            <div class="col-lg-12">


                            <table className="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr.no</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {table_data.map((item, index) => {
                                            return (
                                                <tr key={item.id}>
                                                    <td>{index + 1}</td>
                                                    <td>{item.title}</td>
                                                    <td>{item.quantity}</td>
                                                    <td>{item.price}</td>
                                                </tr>
                                            );
                                        })
                                        }
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
        );
    };
}

export default UserPurchaseDetail