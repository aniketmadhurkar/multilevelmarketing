import React from 'react'

const Test = () => {
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
               Test Page
            </section>
        </div>
    );
};

export default Test