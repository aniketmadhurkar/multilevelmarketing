import React, { useEffect, useState } from "react"
import { CHECK_EMAIL_URL, REGISTER_URL } from "../apiUrls";
import { useNavigate } from "react-router-dom";

const Registration = () => {
    const [user_name, setUserName] = useState('');
    const [email, setEmail] = useState('');
    const [mobile, setMobile] = useState('');
    const [account, setAccount] = useState('');
    const [referral_id, setUnderUserID] = useState('');

    const [password, setPassword] = useState('');
    const [selectedOption, setSelectedOption] = useState('');
    const [emailExists, setEmailExists] = useState(false);
    const [loading, setLoading] = useState(false);
    const handleOptionChange = (event) => {
        setSelectedOption(event.target.value);
    };
    const navigate = useNavigate();
    useEffect(() => {
        const checkEmailExists = async () => {
            try {
                setLoading(true);
                
                fetch(CHECK_EMAIL_URL+"?&email=" + email )
                .then(response => {
                    return response.json()
                }).then(data => {
                    if (data) {
                        var exists=data.exists==="true"?true:false;
                        setEmailExists(exists);
                    }

                })

                
            } catch (error) {
                console.error('Error checking email existence:', error);
            } finally {
                setLoading(false);
            }
        };

        const debounceTimer = setTimeout(() => {
            if (email.trim() !== '') {
                checkEmailExists();
            }
        }, 500); // Debounce time in milliseconds

        return () => {
            clearTimeout(debounceTimer);
        };
    }, [email]);

    const handleSubmit = async (e) => {
        e.preventDefault();

        try {
            fetch(REGISTER_URL+"?user_name=" + user_name + "&mobile=" + mobile + "&email=" + email + "&password=" + password + "&account=" + account + "&referral_id=" + referral_id + "&side=" + selectedOption)
                .then(response => {
                    return response.json()
                }).then(data => {
                    if (data) {
                        if (data.logged_in == 1) {
                            localStorage.setItem('logged_in', data.logged_in);
                            localStorage.setItem('user_id', data.user_id);
                            localStorage.setItem('user_name', data.user_name);
                            //window.location.href = 'http://localhost:8082/testweb/user/home.jsp';
                            navigate("/userhome");
                        }
                        else {
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

        // Perform login logic here, e.g., send API request
        console.log('Email:', email);
        console.log('Password:', password);

        // Reset form fields
        setEmail('');
        setPassword('');
    };
    return (
        <div>
            <section class="page-section bg-primary">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white mt-0">Registration</h2>
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
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <input type="text" name="user_name" class="form-control" required value={user_name}
                                                onChange={(e) => setUserName(e.target.value)} />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" name="email" class="form-control" required value={email}
                                                onChange={(e) => setEmail(e.target.value)} />
                                            {loading && <p>Checking email existence...</p>}
                                            {emailExists && <p>Email already exists.</p>}
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
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <input type="text" name="mobile" class="form-control" required value={mobile}
                                                onChange={(e) => setMobile(e.target.value)} />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Account Number</label>
                                            <input type="text" name="account" class="form-control" required value={account}
                                                onChange={(e) => setAccount(e.target.value)} />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Referal ID (Email)</label>
                                            <input type="text" name="referral_id" class="form-control" value={referral_id}
                                                onChange={(e) => setUnderUserID(e.target.value)} />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Side</label><br />
                                            <input type="radio" name="side" value="left" checked={selectedOption === 'left'}
                                                onChange={handleOptionChange} /> Left &nbsp;&nbsp;
                                            <input type="radio" name="side" value="right" checked={selectedOption === 'right'}
                                                onChange={handleOptionChange} /> Right
                                        </div>
                                    </div>
                                </div>


                                <div class="d-grid mt-2">
                                    <button class="btn btn-primary " id="submitButton"
                                        type="submit">Submit</button>
                                    <a href="/login" class="btn btn-link">Login</a>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </section>
        </div>
    );
};

export default Registration