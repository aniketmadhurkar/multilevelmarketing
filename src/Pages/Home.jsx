import React from 'react'

const Home = () => {
    return (
        <div>
            <div class="container">

                <img src={process.env.PUBLIC_URL + "/images/home_bg.jpeg"} alt="home" className="img-responsive w-100 p-0 m-0" />

            </div>
            <section class="facts-area dark-bg" id="products">
                <div class="container">
                    <h1 className="text-white">
                        Welcome to ABC
                    </h1>
                </div>
            </section>
            <section class="page-section" id="home">
                <div class="container px-4 px-lg-5">
                    <p>
                        ABC is a leading provider of innovative products and a thriving network marketing opportunity. We believe in empowering individuals to achieve their financial goals and lead a fulfilling lifestyle.
                    </p> <h4>
                        Discover the Power of Network Marketing
                    </h4> <p>
                        Are you ready to unlock your potential and create a successful business of your own? With ABC, you have the opportunity to be your own boss and build a team of motivated individuals. By leveraging our proven products and business model, you can enjoy the benefits of residual income and financial freedom.
                    </p>
                    <h4>Our Products
                    </h4>
                    <p>
                        At ABC, we offer a diverse range of high-quality products that cater to various needs and interests. From health and wellness to personal care, beauty, and beyond, our products are meticulously crafted to deliver exceptional results. We are committed to providing you with innovative solutions that enhance your well-being and contribute to a better lifestyle.
                    </p>
                    <h4>Join Our Community</h4>
                    <p>
                        When you join ABC, you become part of a supportive and inspiring community. Our network of distributors is passionate about helping others succeed and achieve their dreams. You'll have access to comprehensive training, mentorship programs, and ongoing support to guide you on your journey to success.
                    </p>
                    <h4>Benefits of Joining ABC
                    </h4> <p>
                        Be your own boss and work on your own terms
                        Unlimited earning potential with a lucrative compensation plan
                        Flexible schedule that allows you to balance work and personal life
                        Training and personal development opportunities to enhance your skills
                        Recognition and rewards for your achievements
                        Connect with like-minded individuals and build valuable relationships
                        Take the First Step Towards Your Success
                    </p> <p>
                        Ready to embark on an exciting entrepreneurial journey with ABC? Join us today and start building your business empire. Experience the power of network marketing and the endless possibilities it offers.
                    </p> <p>

                        Contact us now to learn more and get started on your path to financial independence.
                    </p>


                </div>
            </section>
        </div>
    );
};

export default Home