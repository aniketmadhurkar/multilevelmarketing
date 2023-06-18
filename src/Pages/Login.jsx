import React, { useEffect, useState } from "react"
import { useNavigate } from "react-router-dom";
import { LOGIN_URL } from "../apiUrls";
const Login = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();

        try {
          fetch(LOGIN_URL+"?email=" + email + "&password=" + password)
          .then(response => {
            return response.json()
          })
          .then(data => {
            if(data){
                if(data.logged_in==1){
                    localStorage.setItem('logged_in', data.logged_in);
                    localStorage.setItem('user_id', data.user_id);
                    localStorage.setItem('user_name', data.user_name);
                    //window.location.href = 'http://localhost:8082/testweb/user/home.jsp'; 
                    console.log("u"+data.user_id);
                    navigate('/userhome');
                    
                }
                else{
                    localStorage.setItem('logged_in', data.logged_in);
                    localStorage.setItem('user_id', data.user_id);
                    localStorage.setItem('user_name', data.user_name);
                }
            }
          
          })


        } catch (error) {
          // Handle error
          console.error('Error:', error);
        }

        // Reset form fields
        //setEmail('');
        //setPassword('');
    };
    return (
        <div>
            <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Login</h2>

                        </div>
                    </div>
                </div>
            </section>
            <section class="page-section" id="login">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6 text-center">
                            <h2 class="mt-0">Let's Get Started!</h2>
                        </div>
                    </div>
                    <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                        <div class="col-lg-6 card">

                            <form id="contactForm" class="card-body" onSubmit={handleSubmit}>
                                <div className="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label for="name" class="control-label">User Name</label>
                                            <input
                                                class="form-control"
                                                type="email"
                                                placeholder="Email"
                                                value={email}
                                                onChange={(e) => setEmail(e.target.value)}
                                            />
                                        </div>
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <div class="form-group ">
                                            <label for="name" class="control-label">Password</label>
                                            <input
                                              class="form-control"
                                        type="password"
                                        placeholder="Password"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                    />
                                        </div>
                                    </div>
                                </div>
                                <div>

                                   
                                </div>

                                <div class="d-grid mt-2">
                                    <button class="btn btn-primary " id="submitButton"
                                        type="submit">Submit</button>
                                    <a href="/registration" class="btn btn-link">Register</a>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </section>
        </div>
    );
};

export default Login