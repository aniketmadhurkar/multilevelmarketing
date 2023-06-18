import React, { useEffect, useState } from "react"

import useAuth from "../../services/auth.service";
import UserMenu from "../../components/UserMenu";
import { COMMMISSION_URL } from "../../apiUrls";
import { Navigate } from "react-router-dom";
const UserCommision = () => {
    const { isLoggedIn, user_id, user_name } = useAuth();
    const [table_data, setTableDate] = useState([]);
    const fetchData = () => {
        fetch(COMMMISSION_URL + "?id=" + localStorage.getItem('user_id'))
            .then(response => {
                return response.json()
            })
            .then(data => {
                setTableDate(data);
            })
    }
    useEffect(() => {
        console.log(user_id);
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
                                <h2 class="mt-0">Commisions</h2>
                            </div>
                        </div>
                        <div class="row  justify-content-center mb-5">
                            <div class="col-lg-12">

                                <table className="table">
                                    <thead>
                                        <tr>
                                            <th>Sr.no</th>
                                            <th>Date</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {table_data.map((item, index) => {
                                            const date = new Date(item.date);
                                            const formattedDate = `${date.getDate()}-${date.getMonth() + 1}-${date.getFullYear()}`;

                                            return (
                                                <tr key={item.id}>
                                                    <td>{index + 1}</td>
                                                    <td>{formattedDate}</td>
                                                    <td>{item.amount}</td>
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

export default UserCommision